# Repo Structure Notes

## Why The Repo Was Restructured

The old layout grouped work mostly under `projects/`, which was fine for a single 6-week beginner roadmap but did not scale well once the Junior and Pro roadmaps were added.

The repo now follows a phase-based structure:

- `01_beginner/`
- `02_intermediate_junior/`
- `03_pro_advanced/`

## Folder Rules

- Each phase contains topic modules in numbered order.
- Code should live inside the phase and module it belongs to.
- Notes for study sessions live under `notes/<phase>/`.
- Screenshots and demos go under `assets/` grouped by phase.
- Roadmap summaries and progress tracking stay under `docs/`.

## Migration Mapping

- old `projects/01_dart_basics/` -> `01_beginner/01_setup_dart_basics/exercises/`
- old `projects/02_flutter_basics/first_app/` -> `01_beginner/02_flutter_fundamentals/first_app/`
- old `notes/week-*` -> `notes/beginner/week-*`
- old `assets/screenshots/week-*` -> `assets/screenshots/beginner/week-*`

## Suggested Module Pattern

Each module can grow with a light internal structure such as:

- `app/` for a Flutter app or prototype
- `exercises/` for small Dart practice files
- `docs/` for module-specific references
- `notes.md` for a quick module summary
