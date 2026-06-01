# Draft PR: Add SVG assets and artboards for Math‑for‑Kids MVP

## Title
Add SVG assets and artboards for Math‑for‑Kids MVP (Draft)

## Summary
This draft PR adds vector mascots, icons, stickers, object sprites and 6 hi‑fi artboards intended for design handoff and developer use. Assets are SVG-first to preserve scalability and editability.

Files added (paths)
- assets/svg/
  - mascot_bear.svg
  - mascot_rabbit.svg
  - mascot_robot.svg
  - icon_back.svg
  - icon_sound_on.svg
  - icon_parent_lock.svg
  - sticker_star.svg
  - object_apple.svg
  - button_primary.svg
  - button_primary_blue.svg
  - button_primary_orange.svg
- artboards/
  - counting_artboard.svg
  - compare_artboard.svg
  - addition_artboard.svg
  - subtraction_artboard.svg
  - missingnumber_artboard.svg
  - memory_artboard.svg

## Why (context)
These assets provide a starter design system for the Math‑for‑Kids MVP (replica): mascots for friendly feedback, icons for navigation/settings, object sprites for gameplay, and example hi‑fi artboards for 6 mini‑games (Counting, Compare, Addition, Subtraction, Missing Number, Memory). The goal is a clean handoff to designers and developers.

## How to review (recommended steps)
1. Checkout the branch: `git fetch && git checkout add-svg-assets`.
2. Inspect files in browser or clone locally and open in an SVG editor (Inkscape, Illustrator) or import into Figma (drag & drop).
3. Verify these points:
   - SVGs remain editable vector paths (no embedded raster images).
   - Text layers: if exact typography is critical, either outline text or confirm Nunito/Montserrat availability in Figma pipeline.
   - Artboard sizes are 390x844 and consistent across files.
   - Icons have proper viewBox and scale correctly.
   - Buttons / CTAs meet tappable target size (~44–48 dp after scaling).
   - `id` attributes used with `<use href="#...">` are unique across artboards to avoid collisions when combining files.

## QA checklist (tick before merge)
- [ ] All SVG files render correctly in browser and Figma
- [ ] Paths are vector and editable (no unexpected embedded bitmaps)
- [ ] Text either outlined or verified with font availability (Nunito/Montserrat)
- [ ] Artboards are sized 390×844 and match the Hi‑Fi spec
- [ ] Icons have viewBox and scale properly
- [ ] Buttons/CTAs meet min tap target after scaling
- [ ] No sensitive data or large binary embeds
- [ ] README updated with asset usage and export instructions

## Export / Dev notes
- Recommended export sizes for artboards: 390×844 (@1x), 780×1688 (@2x), 1170×2532 (@3x).
- Example inkscape export (2x):
  - `inkscape artboards/counting_artboard.svg -w 780 -h 1688 -o counting_artboard@2x.png`
- Consider running SVGO (`svgo`) on the `assets/svg/` folder for production builds.
- For web usage: add `aria-hidden="true"` to purely decorative SVGs; include `<title>`/`<desc>` for meaningful icons.

## Known issues & notes
- Text uses font-family fallbacks (Nunito/Montserrat). If designers expect pixel-perfect typography, convert text to outlines or ensure fonts are installed in the design environment.
- Some artboards reuse a symbol via `<use href="#apple">`. If you plan to concatenate SVGs or inline multiple artboards into a single document, prefix IDs to avoid collisions.
- File names are lowercase with underscores — keep naming convention consistent for downstream pipelines.

## Suggested reviewers, labels, milestone
- Reviewers: @rkaksom-beep, @designer (replace with team handles)
- Labels: `design`, `assets`, `feature/mvp`
- Milestone: MVP / Design Handoff

## Merge strategy (recommended)
- Use "Squash and merge" with the commit message: `Add SVG assets and artboards for Math‑for‑Kids MVP`.

---

> To open this as an actual Draft PR on GitHub:
> - Web: Open `https://github.com/rkaksom-beep/Math-anak/compare/main...add-svg-assets?expand=1`, click "Create pull request", then toggle "Create draft pull request".
> - gh CLI: `gh pr create --base main --head add-svg-assets --draft --title "Add SVG assets and artboards for Math‑for‑Kids MVP (Draft)" --body-file ./ .github/PULL_REQUEST_TEMPLATE/add-svg-assets-draft.md`

