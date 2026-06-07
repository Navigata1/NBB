---
name: design-taste
description: >
  Senior frontend design skill: override LLM template biases to produce premium
  UI with intentional typography, color, motion, and layout. Use when user asks
  to "build a UI", "design a page", "make it premium", "fix the design",
  "redesign this", "build a dashboard", or indicates design quality matters.
license: CC BY-NC-SA-4.0
metadata:
  adapted_from: leonxlnx/taste-skill (https://github.com/leonxlnx/taste-skill, SHA bd7e147de80749c05b1610cb739d5ea20ff84899, pinned 2026-03-18)
  upstream_ns: NavigatingTruth / NorthStarFramework
---

# Design Taste Skill

## Purpose

Produce frontend code that looks like a $150k agency build, not an AI template.
This skill corrects LLMs' statistical biases toward generic patterns (centered
layouts, purple gradients, Inter font, three-card grids) and replaces them with
intentional, premium design decisions. It unifies layout, typography, color,
motion, content, and output discipline into a single actionable ruleset.

## When to Activate

- Any task involving frontend interface design or modification
- User mentions design quality, visual polish, or "making it look good"
- Redesign or audit of existing UI
- Component, page layout, dashboard, or landing page work

---

## Active Baseline Dials

Three knobs control generation. Adjust silently based on user intent (e.g.,
"dense dashboard" increases VISUAL_DENSITY to 8). Do not ask users to edit.

| Dial | Default | Range | Low End | High End |
|------|---------|-------|---------|----------|
| DESIGN_VARIANCE | 8 | 1–10 | Centered, symmetrical | Asymmetric, modern |
| MOTION_INTENSITY | 6 | 1–10 | Static, hover-only | Spring physics, scroll choreography |
| VISUAL_DENSITY | 4 | 1–10 | Airy gallery | Cockpit mode, packed data |

---

## Design Engineering Directives

LLMs have measurable statistical biases. These are mandatory overrides.

### Rule 1: Typography — Deterministic, Not Default

- **Headlines:** `text-4xl md:text-6xl tracking-tighter leading-none`. Control
  hierarchy with weight and color, not size alone.
- **Body:** `text-base text-gray-600 leading-relaxed max-w-[65ch]`.
- **Font families:** Banned: Inter, Roboto, Arial, Open Sans, Helvetica.
  Use: Geist, Outfit, Cabinet Grotesk, Satoshi.
- **Serif:** Editorial/creative only; never on dashboards or software UIs.
  Pair with Geist Mono or JetBrains Mono.
- **Weight range:** 400–700 across 3+ weights. Use Medium (500) and SemiBold
  (600) for subtle hierarchy.
- **Numbers in data UIs:** `font-mono` or `font-variant-numeric: tabular-nums`.
- **Orphans:** Fix with `text-wrap: balance` or `text-wrap: pretty`.
- **Headers:** Use sentence case, not Title Case.

### Rule 2: Color Calibration

- Max one accent color, saturation < 80%.
- **LILA BAN [HARD RULE]:** Purple/blue AI gradient aesthetic is forbidden.
  No purple button glows, no neon. Use neutral bases (Zinc/Slate) with singular
  high-contrast accent (Emerald, Electric Blue, Deep Rose).
- Never pure `#000000`; use off-black (`#0a0a0a`, Zinc-950, or tinted).
- One gray temperature (warm OR cool) across the entire project.
- Tint shadows to background hue—no generic `rgba(0,0,0,0.1)`.

### Rule 3: Layout Diversification

- **ANTI-CENTER BIAS:** When DESIGN_VARIANCE > 4, centered Hero is banned.
  Use split-screen (50/50), left-aligned content with right asset, or asymmetric.
- **3-COLUMN CARD BAN:** Generic three-equal-cards layout is banned. Replace
  with 2-column zig-zag, asymmetric grid, horizontal scroll, or masonry.
- **Grid over Flex-math:** Never `w-[calc(33%-1rem)]`. Use CSS Grid:
  `grid grid-cols-1 md:grid-cols-3 gap-6`.
- **Container:** Always `max-w-[1400px] mx-auto` or `max-w-7xl`.
- **Full-height sections:** Never `h-screen`. Use `min-h-[100dvh]` (prevents
  iOS Safari viewport jumping).
- **Mobile collapse:** Asymmetric layouts above `md:` must collapse to
  `w-full px-4 py-8` single-column below 768px.

### Rule 4: Surfaces and Depth

- Cards **only** when elevation communicates hierarchy.
- For VISUAL_DENSITY > 7, prefer `border-t`, `divide-y`, or negative space
  over card containers.
- Tint shadows to background hue.
- **Double-Bezel pattern** for premium containers: outer shell
  (`ring-1 ring-black/5 p-1.5 rounded-[2rem]`) wrapping inner core with
  background and smaller radius.

### Rule 5: Interactive States (Mandatory)

LLMs default to "success" state only. Implement all:
- **Loading:** Skeleton loaders matching layout shape. Never circular spinners.
- **Empty states:** Composed "getting started" views, not blank screens.
- **Error states:** Inline error messages; never `window.alert()`.
- **Hover:** Background shift, subtle scale, or translate.
- **Active/pressed:** `scale-[0.98]` or `-translate-y-[1px]` for tactile feedback.
- **Focus rings:** Visible focus for keyboard navigation.

### Rule 6: Content — THE JANE DOE EFFECT [NAMED RULE]

LLMs generate uncanny placeholder content. Overrides:
- **Banned names:** "John Doe", "Jane Smith", "Sarah Chan", "Jack Su".
  Invent creative, realistic names.
- **Banned numbers:** `99.99%`, `50%`, `$100.00`, `1234567`.
  Use organic: `47.2%`, `$2,847.00`, `+1 (312) 847-1928`.
- **Banned brands:** "Acme", "Nexus", "SmartFlow". Invent contextual names.
- **Banned copy:** "Elevate", "Seamless", "Unleash", "Next-Gen", "Game-changer",
  "Delve", "Tapestry", "In the world of...". Write concrete language.
- **No Lorem Ipsum.** Write real draft copy.
- **Dates:** No identical dates across entries. Randomize realistically.
- **Avatars:** Every distinct person gets unique imagery.

---

## Default Architecture

- **Framework:** React / Next.js with Server Components by default. Use Client
  Components (`"use client"`) only for state, effects, or browser APIs.
  Isolate interactive islands—keep the tree server-rendered.
- **Styling:** Tailwind CSS for 90%+ of styling. **LOCK VERSION:** Read
  `package.json` first. Never use v4 syntax in v3 projects. For v4, use
  `@tailwindcss/postcss` or Vite plugin—never the `tailwindcss` plugin in
  `postcss.config.js`.
- **State:** `useState`/`useReducer` for local UI. Global state only to avoid
  deep prop-drilling. No Redux/Zustand unless already in project.
- **Icons:** `@phosphor-icons/react` or `@radix-ui/react-icons`. Standardize
  `strokeWidth` globally (1.5 or 2.0). Verify import path matches version.
- **ANTI-EMOJI POLICY [HARD BAN]:** Never use emojis in code, markup, or alt
  text. Replace with Phosphor/Radix icons or SVG primitives.
- **Images:** Never use Unsplash URLs (they break). Use
  `https://picsum.photos/seed/{descriptive_string}/W/H` or SVG placeholders.
- **shadcn/ui:** Allowed, but never in default state. Customize radii, colors,
  and shadows.

---

## Creative Arsenal (Layout & Interaction Patterns)

Do not default to generic layouts. Use when appropriate; match complexity to
MOTION_INTENSITY and DESIGN_VARIANCE dials.

### Layout Patterns
1. **Bento Grid:** Asymmetric tile-based grouping with varied spans
   (`col-span-8 row-span-2` beside stacked `col-span-4`).
2. **Split-Screen Scroll:** Two halves sliding in opposite directions on scroll.
3. **Sticky Scroll Stack:** Cards that stick and physically stack during scroll.
4. **Broken Grid:** Elements deliberately ignoring column structure, overlapping
   or bleeding off-screen.

### Navigation & Interaction
5. **Floating Glass Nav:** Detached pill navbar (`mt-6 mx-auto w-max
   rounded-full`) expanding into full-screen overlay with staggered reveals.
6. **Magnetic Button:** Button pulling toward cursor. Use Framer Motion's
   `useMotionValue`/`useTransform`—never `useState` for continuous animation.
7. **Morphing Modal:** Button expanding seamlessly into dialog using `layoutId`.

### Cards & Surfaces
8. **Spotlight Border Card:** Card border illuminating under cursor position.
9. **Parallax Tilt Card:** 3D-tilting card tracking mouse coordinates.
10. **Liquid Glass Panel:** Beyond `backdrop-blur`: add `border-white/10` and
    `shadow-[inset_0_1px_0_rgba(255,255,255,0.1)]` for edge refraction.

### Motion & Reveal
11. **Staggered Orchestration:** Lists/grids cascade with `staggerChildren` or
    CSS `animation-delay: calc(var(--index) * 100ms)`.
12. **Scroll Progress Path:** SVG lines drawing themselves tied to scroll position.
13. **Text Scramble Effect:** Matrix-style character decode on load or hover.

### Typography
14. **Kinetic Marquee:** Endless text band reversing direction on scroll.
15. **Text Mask Reveal:** Large type as transparent window to video beneath.

**Framer Motion vs GSAP/Three.js:** Default to Framer Motion for UI
interactions. Use GSAP/Three.js exclusively for isolated full-page scrolltelling
or canvas backgrounds, wrapped in strict `useEffect` cleanup. Never mix in same
component tree.

---

## Performance Guardrails

These are non-negotiable. Violations cause real user-facing degradation.

| Rule | Do | Don't |
|------|----|-------|
| GPU-safe animation | Animate `transform` and `opacity` only | Animate `top`, `left`, `width`, `height` |
| Blur placement | `backdrop-blur` on fixed/sticky elements only | Blur on scrolling containers |
| Grain/noise overlays | `fixed inset-0 z-50 pointer-events-none` | Attached to scrolling containers |
| Z-index discipline | Reserve for systemic layers (nav, modal, overlay, tooltip) | Arbitrary `z-50` or `z-[9999]` |
| will-change | Sparingly, on actively animating elements only | On everything "just in case" |
| Scroll listeners | `IntersectionObserver` or Framer `whileInView` | `window.addEventListener('scroll')` |
| Effect cleanup | Every `useEffect` animation has cleanup return | Fire-and-forget subscriptions |
| Component isolation | CPU-heavy animations in dedicated Client Components | Mixing heavy animation with server-rendered trees |
| Spring physics | `type: "spring", stiffness: 100, damping: 20` for interaction | `linear` or `ease-in-out` defaults |
| Transition curves | Custom cubic-bezier (`cubic-bezier(0.32, 0.72, 0, 1)`) | Browser default easing |

---

## Redesign Protocol

When applied to an existing project, follow this sequence. Improve what's there
instead of rewriting from scratch.

### Step 1: Scan
Read codebase. Identify: framework, styling method (Tailwind version, vanilla
CSS, styled-components), current design patterns, dependency file.

### Step 2: Diagnose
Run through every directive in this skill. List each generic pattern, weak
point, and missing state. Organize by category (typography, color, layout,
interaction, content).

### Step 3: Fix (Priority Order)
Apply changes in this order for maximum impact with minimum risk:
1. Font swap (biggest instant improvement, lowest risk)
2. Color palette cleanup (remove clashing, kill the Lila)
3. Hover and active states (makes interface feel alive)
4. Layout and spacing (proper grid, max-width, consistent padding)
5. Replace generic components (swap clichés for modern alternatives)
6. Add loading, empty, error states (feels finished)
7. Polish typography scale (premium final touch)

### Rules
- Work with existing tech stack. Do not migrate frameworks.
- Do not break existing functionality. Test after every change.
- Verify new libraries exist in project dependencies before importing.
- Check Tailwind version (v3 vs v4) before modifying config.
- Keep changes reviewable. Small, targeted improvements over big rewrites.

---

## Output Rules

Every response with code is production-critical. Partial output is broken output.

### Hard-Banned Patterns (Never Produce)

**In code blocks:**
`// ...`, `// rest of code`, `// implement here`, `// TODO`, `/* ... */`,
`// similar to above`, `// continue pattern`, `// add more as needed`, bare
`...` standing in for omitted code.

**In prose:**
"Let me know if you want me to continue", "I can provide more details",
"for brevity", "the rest follows the same pattern", "and so on" (replacing
actual content), "I'll leave that as an exercise".

**Structural shortcuts:**
Skeleton when full implementation was requested. First and last sections while
skipping middle. Repeated logic shown once with description. Describing code
instead of writing it.

### Long Output Protocol
When approaching token limit:
- Do not compress remaining sections.
- Do not skip to conclusion.
- Write at full quality to clean breakpoint (end of function, file, or section).
- End with: `[PAUSED — X of Y complete. Send "continue" to resume.]`
- On "continue", resume exactly. No recap, no repetition.

### Scope Lock
1. Count distinct deliverables user requested. Lock that number.
2. Generate every deliverable completely.
3. Before responding, re-read request. Compare deliverable count against scope.
   Add anything missing.

---

## Pre-Flight Checklist

Evaluate output against this matrix before delivering. No exceptions.

- [ ] No banned fonts (Inter, Roboto, Arial, Open Sans, Helvetica)
- [ ] No Lila Ban violations (purple/blue AI gradients, neon glows)
- [ ] No Jane Doe Effect (generic names, round numbers, "Acme Corp", clichés)
- [ ] No emojis in code or content—icons only
- [ ] Tailwind version matches project (`package.json` checked)
- [ ] Mobile collapse guaranteed (`w-full px-4`, single-column below 768px)
- [ ] Full-height sections use `min-h-[100dvh]`, not `h-screen`
- [ ] All interactive elements have hover, active, focus states
- [ ] Loading, empty, error states provided
- [ ] Animations use only `transform` and `opacity`—no layout-triggering props
- [ ] `useEffect` animations contain cleanup functions
- [ ] CPU-heavy animations isolated in dedicated Client Components
- [ ] `backdrop-blur` only on fixed/sticky elements
- [ ] No arbitrary z-indexes—systemic layers only
- [ ] No banned output patterns (`// ...`, `// TODO`, placeholder shortcuts)
- [ ] Every requested deliverable present and complete
- [ ] Container constrained (`max-w-7xl mx-auto` or equivalent)
- [ ] Custom transition curves—no `linear` or `ease-in-out` defaults
- [ ] Import paths verified against installed dependencies

---

## Anti-Patterns (Quick Reference)

| Pattern | Why Banned | Replace With |
|---------|-----------|--------------|
| Centered hero with dark background image | Most common AI layout | Split-screen, left-aligned, asymmetric whitespace |
| 3 equal cards in a row | Generic feature row | Zig-zag, bento grid, horizontal scroll |
| Purple/blue gradient buttons | "AI aesthetic" (Lila Ban) | Neutral base + singular accent |
| Inter font | LLM default | Geist, Outfit, Cabinet Grotesk, Satoshi |
| `h-screen` | iOS Safari viewport bug | `min-h-[100dvh]` |
| Circular loading spinner | Lazy loading | Skeleton loader matching layout |
| "John Doe" / "Acme Corp" | Jane Doe Effect | Creative, realistic placeholder data |
| Unsplash URLs | Frequently break | `picsum.photos/seed/{name}/W/H` |
| `window.addEventListener('scroll')` | Continuous reflows | `IntersectionObserver` or Framer `whileInView` |
| Emojis as icons | Unprofessional, inconsistent | Phosphor or Radix icon components |
| `ease-in-out` transitions | Browser default, feels cheap | Custom cubic-bezier or spring physics |
| `z-[9999]` | Z-index chaos | Systemic layer scale |
| Generic shadcn defaults | Template look | Customized radii, colors, shadows |

---

## When NOT to Use

This skill is specifically for **visual frontend design and engineering**. It is
the wrong tool for:

- **Non-visual tasks** (API design, data architecture, infrastructure): use
  /plan, /spec-plan, or domain-specific skills instead.
- **Rapid prototyping with placeholder UI**: design-taste optimizes for premium
  final output, not speed. Use basic templates first, then apply this skill to
  polish.
- **Accessibility-first designs:** While this skill honors focus states and WCAG
  basics, for complex accessibility audits or screen-reader optimization use
  /ecc:accessibility.
- **Brand-locked designs** where every pixel must match a pre-existing design
  system: apply the principles here only where your project already has freedom.
  For strict brand adherence, work with your design system directly.
- **Backend or logic-layer work**: this skill does not help with server-side
  code, database design, or business logic.
- **Motion design for video/animation production**: for complex video work
  (Manim, Remotion, Blender), use /ecc:video-editing, /ecc:manim-video, or
  /ecc:remotion-video-creation.

---

## Portability

This skill works across all Claude Code environments: Desktop, Web, Codex,
Cursor, and Antigravity. All directives are framework-agnostic and translate
to Svelte, Vue, Astro, or other React-adjacent stacks by swapping syntax
(TypeScript, JSX—the design principles remain identical).

**Deprecation note:** The Redesign Protocol's "Step 1: Scan" assumes you have
direct filesystem access to read `package.json` and source files. In browser-only
environments (Codex, Antigravity), ask the user to paste the relevant config
and source snippets, or use web-based code editors and /ccg:inspect tools
to surface file contents.

All external references (Phosphor Icons, Tailwind, Geist fonts, picsum.photos)
are stable, public URLs. Cache-time is not a concern for this skill—no locked
APIs or deprecated services.
