# Third-Party Notices

NBB references third-party skills as pinned upstream sources (via the skill-pack
manifests in `packs/`). It does NOT blend third-party text into NBB methodology
prose. Skills are fetched at a pinned commit SHA by the builder, gated by
`scripts/vet_skill.sh`, and assembled into a pack (a build artifact) — each
carrying its upstream license. This file records the upstream licenses.

---

## ECC-Prime

- **Upstream:** https://github.com/Navigata1/ECC-Prime
- **Pinned commit:** `7113b5bf63694b716f8b2413c5919824a82fc095`
- **License:** MIT
- **Used as:** a pinned, vetted source in `packs/extended-300.json` (218 canonical
  skills adopted after passing `scripts/vet_skill.sh`; see
  `packs/ECC_PRIME_VET_REPORT.md`). ECC-Prime skill files are NOT vendored into
  this repository's tree; they are fetched at the pinned SHA at pack-build time
  and carried in the built pack with this attribution.

```
MIT License

Copyright (c) 2026 Affaan Mustafa

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

> When a built pack includes ECC-Prime skills, this MIT notice and copyright must
> travel with the distributed pack (the builder records each entry's license in
> the pack `MANIFEST.json`). NBB's own materials remain CC BY-NC-SA 4.0; the two
> licenses are kept clearly separated.
