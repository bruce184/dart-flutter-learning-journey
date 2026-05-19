# Session 14 - GridView and SingleChildScrollView

## Goal

- Learn when to use `GridView`.
- Practice `GridView.builder`.
- Use `SliverGridDelegateWithFixedCrossAxisCount` to control grid layout.
- Understand `crossAxisCount`, `crossAxisSpacing`, `mainAxisSpacing`, and `childAspectRatio`.
- Practice `SingleChildScrollView` for screens with one long mixed-content child.
- Review why scrollable widgets inside a `Column` often need `Expanded`.

## Output Completed

- Created the Session 14 exercise material.
- Built the practice app in `01_beginner/03_layout_forms_navigation/exercises/session14/session14_grid_scroll_app`.
- Created a category grid screen.
- Added category data with name, icon, and color.
- Used `GridView.builder` to build repeated category cards.
- Used `SliverGridDelegateWithFixedCrossAxisCount` for a 2-column layout.
- Practiced spacing between grid rows and columns.
- Reviewed when `SingleChildScrollView` is a better choice than `GridView`.

## Evidence

- Related project: `01_beginner/03_layout_forms_navigation/exercises/session14/session14_grid_scroll_app`
- Practice file: `01_beginner/03_layout_forms_navigation/exercises/session14/session14_grid_scroll.md`
- Main implementation file: `01_beginner/03_layout_forms_navigation/exercises/session14/session14_grid_scroll_app/lib/main.dart`

## What I Understood

- `GridView` is useful for repeated items that should appear in rows and columns.
- `GridView.builder` builds grid items from data, similar to how `ListView.builder` builds list rows.
- `crossAxisCount` controls how many columns appear in the grid.
- `crossAxisSpacing` controls horizontal space between grid items.
- `mainAxisSpacing` controls vertical space between grid items.
- `childAspectRatio` controls the width-to-height ratio of each grid item.
- A `GridView` inside a `Column` usually needs `Expanded` so Flutter knows how much height it should use.
- `SingleChildScrollView` receives one direct child, often a `Column`.
- `SingleChildScrollView` is better for pages with mixed content, such as profile, detail, or form screens.

## What Is Still Unclear

- I should keep practicing the difference between `mainAxisSpacing` and `crossAxisSpacing`.
- I need more repetition choosing between `ListView`, `GridView`, and `SingleChildScrollView`.
- I should pay attention to nested scrollable widgets so layout does not become confusing.

## What I Need To Review Next Session

- Combine `Row`, `Column`, `Padding`, `SizedBox`, `Expanded`, `ListView`, and `GridView`.
- Build a small layout mini project for Session 15.
- Explain why each layout or scrollable widget is chosen.

