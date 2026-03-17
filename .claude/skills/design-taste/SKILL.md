---
name: design-taste
version: 1.0
author: NavigatingTruth / NorthStarFramework
description: >
  Senior design engineer skill for premium frontend output. Overrides default
  LLM biases to produce high-end, non-generic interfaces with proper motion,
  typography, spacing, and visual quality. Use when user says "build a UI",
  "design a page", "frontend component", "make it look premium", "redesign
  this", "fix the design", "UI/UX", "landing page", "dashboard design",
  "make it look good", "it looks generic", "build a dashboard", "hero section".
triggers:
  - "build a UI"
  - "design a page"
  - "frontend component"
  - "make it look premium"
  - "redesign this"
  - "fix the design"
  - "UI/UX"
  - "landing page"
  - "dashboard design"
  - "make it look good"
  - "hero section"
---

# Design Taste Skill

## Purpose

Produce frontend code that looks like a $150k agency build, not an AI template.
This skill corrects the statistical biases LLMs have toward generic, cliché UI
patterns (centered layouts, purple gradients, Inter font, three-card grids) and
replaces them with intentional, premium design decisions. It unifies layout,
typography, color, motion, content, and output discipline into a single
actionable ruleset.

Adapted from leonxlnx/taste-skill. Unified and compressed for the NS Framework.

## When to Activate

- Any task involving building or modifying a frontend interface
- User mentions design quality, visual polish, or "making it look good"
- Redesign or audit of an existing UI
- Component creation, page layout, dashboard, or landing page work

---

## Active Baseline Configuration

Three dials control every generation. These are the defaults — adapt dynamically
if the user's prompt implies a different profile (e.g. "dense dashboard" → bump
VISUAL_DENSITY to 8).

| Dial | Default | Range | Low End | High End |
|------|---------|-------|---------|----------|
| **DESIGN_VARIANCE** | **8** | 1–10 | Centered, symmetrical grids | Asymmetric, massive whitespace, modern |
| **MOTION_INTENSITY** | **6** | 1–10 | Static, hover-only | Spring physics, scroll-triggered choreography |
| **VISUAL_DENSITY** | **4** | 1–10 | Art gallery, airy, one element at a time | Cockpit mode, packed data, monospace numbers |

**Do not ask the user to edit this file.** Read their intent from the prompt and
adjust the dials silently. These values drive the logic in every section below.

---

## Default Architecture

- **Framework:** React / Next.js with Server Components by default.
  Client Components (`"use client"`) only when state, effects, or browser APIs
  are required. Isolate interactive islands — keep the tree server-rendered.
- **Styling:** Tailwind CSS for 90%+ of styling.
  - **TAILWIND VERSION LOCK:** Read `package.json` first. Never use v4 syntax
    in a v3 project. For v4, use `@tailwindcss/postcss` or the Vite plugin —
    never the `tailwindcss` plugin in `postcss.config.js`.
- **State:** `useState`/`useReducer` for local UI. Global state only to avoid
  deep prop-drilling. No arbitrary Redux/Zustand unless the project already uses it.
- **Icons:** `@phosphor-icons/react` or `@radix-ui/react-icons`. Standardize
  `strokeWidth` globally (1.5 or 2.0). Verify the import path matches the
  installed package version.
- **ANTI-EMOJI POLICY [HARD BAN]:** Never use emojis in code, markup, text
  content, or alt text. Replace with Phosphor/Radix icons or clean SVG primitives.
- **Images:** Never use Unsplash URLs (they break). Use
  `https://picsum.photos/seed/{descriptive_string}/W/H` or SVG placeholders.
- **shadcn/ui:** Allowed, but never in default state. Customize radii, colors,
  and shadows to match the project aesthetic.

---

## Design Engineering Directives (Bias Correction)

LLMs have measurable statistical biases toward specific cliché patterns.
These rules are mandatory overrides.

### Rule 1: Typography — Deterministic, Not Default

- **Display/Headlines:** `text-4xl md:text-6xl tracking-tighter leading-none`.
  Control hierarchy with weight and color, not just size.
- **Body:** `text-base text-gray-600 leading-relaxed max-w-[65ch]`.
- **Banned fonts:** Inter, Roboto, Arial, Open Sans, Helvetica.
  Use `Geist`, `Outfit`, `Cabinet Grotesk`, or `Satoshi` instead.
- **Serif fonts:** Allowed only for editorial/creative contexts. **Banned** on
  dashboards and software UIs — use `Geist + Geist Mono` or `Satoshi + JetBrains Mono`.
- **Weight range:** Use 400–700 across at least 3 weights. Introduce Medium
  (500) and SemiBold (600) for subtle hierarchy.
- **Numbers in data UIs:** Use `font-mono` or `font-variant-numeric: tabular-nums`.
- **Orphaned words:** Fix with `text-wrap: balance` or `text-wrap: pretty`.
- **Title Case headers:** Use sentence case instead.

### Rule 2: Color Calibration

- Max **1 accent color**. Saturation < 80%.
- **THE LILA BAN [NAMED RULE]:** The "AI Purple/Blue" gradient aesthetic is
  **hard-banned**. No purple button glows, no neon gradients. Use neutral bases
  (Zinc/Slate) with a singular high-contrast accent (Emerald, Electric Blue, Deep Rose).
- Never use pure `#000000`. Use off-black (`#0a0a0a`, Zinc-950, or tinted dark).
- Stick to one gray temperature (warm OR cool) across the entire project.
- Tint shadows to match the background hue — no generic `rgba(0,0,0,0.1)`.

### Rule 3: Layout Diversification

- **ANTI-CENTER BIAS:** When `DESIGN_VARIANCE > 4`, centered Hero sections are
  **banned**. Use split-screen (50/50), left-aligned content with right asset,
  or asymmetric whitespace.
- **3-COLUMN CARD BAN:** The generic "3 equal cards" feature row is **banned**.
  Use 2-column zig-zag, asymmetric grid, horizontal scroll, or masonry.
- **Grid over Flex-math:** Never use `w-[calc(33%-1rem)]`. Use CSS Grid
  (`grid grid-cols-1 md:grid-cols-3 gap-6`).
- **Container constraint:** Always `max-w-[1400px] mx-auto` or `max-w-7xl`.
- **Viewport stability:** Never `h-screen` for full-height sections. Always
  `min-h-[100dvh]` (prevents iOS Safari viewport jumping).
- **Mobile override:** Any asymmetric layout above `md:` must collapse to
  `w-full px-4 py-8` single-column below 768px.

### Rule 4: Surfaces and Depth

- Use cards **only** when elevation communicates hierarchy.
- For `VISUAL_DENSITY > 7`, prefer `border-t`, `divide-y`, or negative space
  over card containers.
- When shadows are used, tint them to the background hue.
- Apply the "Double-Bezel" pattern for premium containers: outer shell
  (`ring-1 ring-black/5`, `p-1.5`, `rounded-[2rem]`) wrapping an inner core
  with its own background and a calculated smaller radius.

### Rule 5: Interactive States (Mandatory)

LLMs default to rendering only the "success" state. You **must** implement:
- **Loading:** Skeleton loaders matching layout shape. No circular spinners.
- **Empty states:** Composed "getting started" views, not blank screens.
- **Error states:** Clear inline error messages. Never `window.alert()`.
- **Hover:** Background shift, subtle scale, or translate.
- **Active/pressed:** `scale-[0.98]` or `-translate-y-[1px]` for tactile feedback.
- **Focus rings:** Visible focus indicators for keyboard navigation (accessibility).

### Rule 6: Content — THE JANE DOE EFFECT [NAMED RULE]

LLMs generate uncanny, robotic placeholder content. Override:
- **Banned names:** "John Doe", "Jane Smith", "Sarah Chan", "Jack Su".
  Invent creative, realistic-sounding names.
- **Banned numbers:** `99.99%`, `50%`, `$100.00`, `1234567`.
  Use organic data: `47.2%`, `$2,847.00`, `+1 (312) 847-1928`.
- **Banned brand names:** "Acme", "Nexus", "SmartFlow".
  Invent contextual, believable names.
- **Banned copy:** "Elevate", "Seamless", "Unleash", "Next-Gen", "Game-changer",
  "Delve", "Tapestry", "In the world of...". Write concrete, specific language.
- **No Lorem Ipsum.** Write real draft copy.
- **No identical dates** across blog posts / entries. Randomize realistically.
- **No duplicate avatars.** Every distinct person gets unique imagery.

---

## Creative Arsenal (Condensed)

Do not default to generic layouts. Pull from this library when appropriate.
Match complexity to the `MOTION_INTENSITY` and `DESIGN_VARIANCE` dials.

### Layout Patterns
1. **Bento Grid** — Asymmetric tile-based grouping with varied spans
   (`col-span-8 row-span-2` beside stacked `col-span-4`).
2. **Split-Screen Scroll** — Two halves sliding in opposite directions on scroll.
3. **Sticky Scroll Stack** — Cards that stick and physically stack during scroll.
4. **Broken Grid** — Elements deliberately ignoring column structure, overlapping
   or bleeding off-screen.

### Navigation & Interaction
5. **Floating Glass Nav** — Detached pill navbar (`mt-6 mx-auto w-max rounded-full`)
   that expands into a full-screen overlay menu with staggered link reveals.
6. **Magnetic Button** — Button that pulls toward the cursor. Use Framer Motion's
   `useMotionValue`/`useTransform` — **never** `useState` for continuous animation.
7. **Morphing Modal** — Button that seamlessly expands into its own dialog
   using `layoutId`.

### Cards & Surfaces
8. **Spotlight Border Card** — Card border that illuminates dynamically under
   the cursor position.
9. **Parallax Tilt Card** — 3D-tilting card tracking mouse coordinates.
10. **Liquid Glass Panel** — Beyond `backdrop-blur`: add `border-white/10` and
    `shadow-[inset_0_1px_0_rgba(255,255,255,0.1)]` for edge refraction.

### Motion & Reveal
11. **Staggered Orchestration** — Lists/grids cascade in with `staggerChildren`
    or CSS `animation-delay: calc(var(--index) * 100ms)`.
12. **Scroll Progress Path** — SVG lines that draw themselves tied to scroll position.
13. **Text Scramble Effect** — Matrix-style character decode on load or hover.

### Typography
14. **Kinetic Marquee** — Endless text band that reverses direction on scroll.
15. **Text Mask Reveal** — Large type acting as a transparent window to video beneath.

**Framer Motion vs GSAP/Three.js:** Default to Framer Motion for UI interactions.
Use GSAP/Three.js **exclusively** for isolated full-page scrolltelling or canvas
backgrounds, wrapped in strict `useEffect` cleanup. Never mix them in the same
component tree.

---

## Performance Guardrails

These are non-negotiable. Violations cause real user-facing degradation.

| Rule | Do | Don't |
|------|----|-------|
| **GPU-safe animation** | Animate `transform` and `opacity` only | Animate `top`, `left`, `width`, `height` |
| **Blur placement** | `backdrop-blur` on fixed/sticky elements only | Blur on scrolling containers (continuous GPU repaint) |
| **Grain/noise overlays** | `fixed inset-0 z-50 pointer-events-none` | Attached to scrolling containers |
| **Z-index discipline** | Reserve for systemic layers (nav, modal, overlay, tooltip) | Arbitrary `z-50` or `z-[9999]` |
| **will-change** | Sparingly, only on actively animating elements | On everything "just in case" |
| **Scroll listeners** | `IntersectionObserver` or Framer `whileInView` | `window.addEventListener('scroll')` |
| **Effect cleanup** | Every `useEffect` animation has a cleanup return | Fire-and-forget subscriptions |
| **Component isolation** | CPU-heavy perpetual animations in dedicated Client Components | Mixing heavy animation with server-rendered trees |
| **Spring physics** | `type: "spring", stiffness: 100, damping: 20` for interactive elements | `linear` or `ease-in-out` defaults |
| **Transition curves** | Custom cubic-bezier (`cubic-bezier(0.32, 0.72, 0, 1)`) | Browser default easing |

---

## Redesign Protocol

When applied to an existing project, follow this sequence. Do not rewrite from
scratch — improve what's there.

### Step 1: Scan
Read the codebase. Identify: framework, styling method (Tailwind version,
vanilla CSS, styled-components), current design patterns, dependency file.

### Step 2: Diagnose
Run through every directive in this skill. List each generic pattern, weak
point, and missing state found. Organize by category (typography, color,
layout, interaction, content).

### Step 3: Fix (Priority Order)
Apply changes in this order for maximum impact with minimum risk:
1. **Font swap** — biggest instant improvement, lowest risk
2. **Color palette cleanup** — remove clashing/oversaturated colors, kill the Lila
3. **Hover and active states** — makes the interface feel alive
4. **Layout and spacing** — proper grid, max-width, consistent padding
5. **Replace generic components** — swap cliché patterns for modern alternatives
6. **Add loading, empty, and error states** — makes it feel finished
7. **Polish typography scale** — the premium final touch

### Rules
- Work with the existing tech stack. Do not migrate frameworks.
- Do not break existing functionality. Test after every change.
- Before importing any new library, verify it exists in the project's dependencies.
- Check Tailwind version (v3 vs v4) before modifying config.
- Keep changes reviewable. Small, targeted improvements over big rewrites.

---

## Output Rules

Every response that includes code is production-critical. Partial output is
broken output.

### Hard-Banned Patterns

**In code blocks (never produce these):**
`// ...`, `// rest of code`, `// implement here`, `// TODO`, `/* ... */`,
`// similar to above`, `// continue pattern`, `// add more as needed`,
bare `...` standing in for omitted code.

**In prose (never write these):**
"Let me know if you want me to continue", "I can provide more details",
"for brevity", "the rest follows the same pattern", "and so on" (replacing
actual content), "I'll leave that as an exercise".

**Structural shortcuts (never do these):**
Outputting a skeleton when the request was for a full implementation. Showing
first and last sections while skipping the middle. Replacing repeated logic
with one example and a description. Describing what code should do instead
of writing it.

### Long Output Protocol
When approaching the token limit:
- Do not compress remaining sections.
- Do not skip to a conclusion.
- Write at full quality to a clean breakpoint (end of function, file, or section).
- End with: `[PAUSED — X of Y complete. Send "continue" to resume from: next section]`
- On "continue", resume exactly. No recap, no repetition.

### Scope Lock
1. Count the distinct deliverables the user requested. Lock that number.
2. Generate every deliverable completely.
3. Before responding, re-read the request. Compare deliverable count against scope. If anything is missing, add it.

---

## Pre-Flight Checklist

Evaluate your output against this matrix **before** delivering. This is the
final gate — no exceptions.

- [ ] No banned fonts (Inter, Roboto, Arial, Open Sans, Helvetica) present
- [ ] No Lila Ban violations (purple/blue AI gradients, neon glows)
- [ ] No Jane Doe Effect (generic names, round numbers, "Acme Corp", AI clichés)
- [ ] No emojis anywhere in code or content — icons only
- [ ] Tailwind version matches the project (`package.json` checked)
- [ ] Mobile collapse guaranteed (`w-full`, `px-4`, single-column below 768px)
- [ ] Full-height sections use `min-h-[100dvh]`, not `h-screen`
- [ ] All interactive elements have hover, active, and focus states
- [ ] Loading, empty, and error states are provided
- [ ] Animations use only `transform` and `opacity` — no layout-triggering props
- [ ] `useEffect` animations contain cleanup functions
- [ ] CPU-heavy animations isolated in dedicated Client Components
- [ ] `backdrop-blur` only on fixed/sticky elements
- [ ] No arbitrary z-indexes — systemic layers only
- [ ] No banned output patterns (`// ...`, `// TODO`, placeholder shortcuts)
- [ ] Every requested deliverable is present and complete
- [ ] Container constrained (`max-w-7xl mx-auto` or equivalent)
- [ ] Custom transition curves — no `linear` or `ease-in-out` defaults
- [ ] Import paths verified against installed dependencies

---

## Anti-Patterns (Quick Reference)

| Pattern | Why It's Banned | Replace With |
|---------|----------------|--------------|
| Centered hero with dark background image | Most common AI layout | Split-screen, left-aligned, asymmetric whitespace |
| 3 equal cards in a row | Generic feature row | Zig-zag, bento grid, horizontal scroll |
| Purple/blue gradient buttons | "AI aesthetic" fingerprint (Lila Ban) | Neutral base + singular accent |
| Inter font | LLM default bias | Geist, Outfit, Cabinet Grotesk, Satoshi |
| `h-screen` | iOS Safari viewport bug | `min-h-[100dvh]` |
| Circular loading spinner | Lazy loading state | Skeleton loader matching layout shape |
| "John Doe" / "Acme Corp" | Jane Doe Effect | Creative, realistic placeholder data |
| Unsplash image URLs | Frequently break | `picsum.photos/seed/{name}/W/H` |
| `window.addEventListener('scroll')` | Continuous reflows | `IntersectionObserver` or Framer `whileInView` |
| Emojis as icons | Unprofessional, inconsistent | Phosphor or Radix icon components |
| `ease-in-out` transitions | Browser default, feels cheap | Custom cubic-bezier or spring physics |
| `z-[9999]` | Z-index chaos | Systemic layer scale |
| Generic shadcn defaults | Template look | Customized radii, colors, shadows |
