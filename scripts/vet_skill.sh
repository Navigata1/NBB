#!/bin/bash
# =============================================================================
# NBB - Per-Skill Security Gate (vet_skill) - v2 context-aware
#
# Statically scans ONE skill file for the patterns that make third-party skills
# dangerous: prompt injection, pipe-to-shell, reverse shells, credential/exfil,
# obfuscation, and destructive commands.
#
# v2 reduces false positives on DEFENSIVE security-education skills: a dangerous
# token only counts when it appears in an EXECUTABLE context. A match is EXEMPT
# (descriptive, not executable) when it is in a markdown table row, a blockquote,
# after a '#' comment, inside inline-code/backticks, or on a line carrying clear
# defensive markers (CWE, vulnerability, attack, detect, prevent, example, ...).
# This is principled: tables/comments/quotes/prose do not execute. Bare dangerous
# commands still FAIL.
#
# Usage:  bash scripts/vet_skill.sh <path-to-SKILL.md>
# Exit:   0 = PASS    2 = WARN (review)    1 = FAIL (block)    3 = usage/error
#
# Still a STATIC heuristic gate: necessary, not sufficient. High-trust sources +
# pinned SHAs + human review still apply. ASCII-only.
# =============================================================================
set -uo pipefail

FILE="${1:-}"
[ -z "$FILE" ] && { echo "usage: vet_skill.sh <SKILL.md>" >&2; exit 3; }
[ -f "$FILE" ] || { echo "FAIL: not found: $FILE" >&2; exit 1; }

fail=0; warn=0
hit() { echo "  [$1] $2"; }

# A line is EXEMPT (non-executable / defensive) for a given token regex if:
#   - it is a table row or blockquote, OR
#   - the token appears after a '#' comment, OR
#   - the token is wrapped in inline-code backticks, OR
#   - the line carries a defensive marker word.
EXEMPT_MARKERS='CWE|vulnerab|malicious|attacker|attack|exploit|detect|prevent|mitigat|sanitiz|escap|audit|threat|red.?team|penetrat|owasp|injection|payload|impact|do not|never run|never execute|example|e\.g\.|sample|illustrat|demonstrat|forbidden|blocked|reject'

# Print only NON-exempt matching lines for <regex>; empty output => no real hit.
real_hits() {
  local re="$1"
  LC_ALL=C grep -nIE "$re" "$FILE" 2>/dev/null | while IFS= read -r m; do
    local c="${m#*:}"
    LC_ALL=C printf '%s' "$c" | grep -qE '^[[:space:]]*[|>]' && continue          # table / blockquote
    LC_ALL=C printf '%s' "$c" | grep -qE '#.*'"$re" && continue                    # after a # comment
    LC_ALL=C printf '%s' "$c" | grep -qE '`[^`]*'"$re"'[^`]*`' && continue         # inline-code example
    LC_ALL=C printf '%s' "$c" | grep -qiE "$EXEMPT_MARKERS" && continue            # defensive marker
    printf '%s\n' "$c"
  done
}

fscan() { # fscan <regex> <label>  (FAIL if any NON-exempt match)
  local r; r="$(real_hits "$1")"
  if [ -n "$r" ]; then hit FAIL "$2"; printf '%s\n' "$r" | head -2 | sed 's/^/        > /'; fail=1; fi
}
wscan() { # wscan <regex> <label>  (WARN if any NON-exempt match)
  local r; r="$(real_hits "$1")"
  if [ -n "$r" ]; then hit WARN "$2"; printf '%s\n' "$r" | head -1 | sed 's/^/        > /'; warn=1; fi
}

echo "vet: $FILE"

# --- CRITICAL: auto-block (executable context only) ---
fscan '(curl|wget)[^|]*\|[[:space:]]*(sudo[[:space:]]+)?(bash|sh|zsh)' "pipe-to-shell (curl|wget | sh)"
fscan 'base64[[:space:]]+(-d|--decode|-D)[^|]*\|[[:space:]]*(bash|sh|zsh|python)' "base64 decode piped to interpreter"
fscan 'eval[[:space:]]*[("'"'"']*[[:space:]]*\$\((curl|wget)' "eval of remote fetch"
fscan '/dev/tcp/[0-9]' "reverse shell (/dev/tcp)"
fscan 'nc[[:space:]]+(-[a-zA-Z]*e|.*-e)[[:space:]]' "netcat exec (-e) reverse shell"
fscan 'bash[[:space:]]+-i[[:space:]]*>&[[:space:]]*/dev/tcp' "interactive bash reverse shell"
fscan ':[[:space:]]*\(\)[[:space:]]*\{[^}]*:[[:space:]]*\|[[:space:]]*:' "fork bomb"
fscan 'rm[[:space:]]+-[a-zA-Z]*rf?[a-zA-Z]*[[:space:]]+(/|~|\$HOME|\*)([[:space:]]|$)' "destructive rm -rf on root/home"
fscan '(cat|cp|scp)[^\n]*(\.ssh/id_|\.aws/credentials|\.config/gh)' "reads private keys/credentials"
fscan 'ignore[[:space:]]+(all[[:space:]]+)?(previous|prior|the[[:space:]]+above)[[:space:]]+instructions' "prompt injection: ignore-previous-instructions"
fscan 'disregard[[:space:]]+(the[[:space:]]+)?(above|prior|previous|system|all)' "prompt injection: disregard"
fscan '(reveal|print|output|repeat|leak)[^\n]{0,30}(system[[:space:]]+prompt|your[[:space:]]+instructions)' "prompt injection: exfil system prompt"
fscan 'exfiltrat' "exfiltration intent"
fscan '(--dangerously-skip-permissions|--yolo|skip[_-]permissions)' "encourages bypassing permission guards"

# --- WARN: route to human review (executable context only) ---
wscan 'curl[^\n]*-X[[:space:]]*POST[^\n]*https?://' "outbound POST to a URL"
wscan '\b(([0-9]{1,3}\.){3}[0-9]{1,3})\b' "hardcoded IP address"
wscan '[A-Za-z0-9+/]{200,}={0,2}' "long base64/obfuscated blob"
wscan 'chmod[[:space:]]+(-R[[:space:]]+)?777' "chmod 777 (over-broad perms)"
wscan '>>[[:space:]]*~?/?\.(bashrc|zshrc|profile|bash_profile)' "writes to shell rc"
wscan '(process\.env|os\.environ|printenv|env)[^\n]{0,40}(curl|fetch|http|post)' "environment variables near network call"
wscan 'discord\.com/api/webhooks|hooks\.slack\.com|webhook[^\n]{0,40}https?://|https?://[^\n]{0,40}webhook' "webhook URL (potential exfil endpoint)"

# --- Hygiene: front-matter present ---
head -1 "$FILE" | grep -q '^---' || { hit WARN "missing YAML front-matter (name/description)"; warn=1; }

echo "---"
if [ "$fail" -eq 1 ]; then echo "VERDICT: FAIL (blocked from pack)"; exit 1; fi
if [ "$warn" -eq 1 ]; then echo "VERDICT: WARN (manual review required before inclusion)"; exit 2; fi
echo "VERDICT: PASS"; exit 0
