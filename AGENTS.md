# SWE Agents — Working Agreement (Flutter + Flame Farm Game)

## Goal
Generate clean Flutter UI based on provided designs, ready for Flame integration later.

## Roles
### 0) UI Catalog Agent (First step)
Responsible for:
- Listing every screenshot in `ui_design/`
- Creating a "UI Screen Map" document: filename -> screen name -> route name -> feature module
- Ensuring every design becomes a screen stub at minimum

Deliverables:
- `ui_design/ui_screen_map.md`
- Initial route table added to `lib/app/routes.dart`

### 1) Architect Agent
Responsible for:
- Folder structure
- Core constants/theme system
- Navigation/provider skeleton
- Repository/data source interfaces (offline now, remote later)

Deliverables:
- `lib/app/*`, `lib/core/*`, `lib/features/navigation/*`
- Base widgets: scaffold, title banner, bottom nav, panel cards, buttons

### 2) UI Agent
Responsible for:
- Implementing the 4 screens to match design images
- Extracting reusable widgets
- Using ONLY constants for colors/text/assets/dimensions

Deliverables:
- `ui_design/` screens (as specified)
- Feature presentation screens/widgets

### 3) State Agent
Responsible for:
- Provider models (ChangeNotifier)
- Dummy local data (hardcoded in local datasource, not in UI)
- ViewModels exposing simple state for UI rendering

Deliverables:
- providers in `features/*/presentation` or `features/*/navigation`

### 4) Quality Agent
Responsible for:
- Code review checklist
- Ensuring no hardcoded strings/colors/assets
- Ensuring consistent naming and structure
- Ensuring build compiles

Deliverables:
- Small refactors, file splits, naming fixes
- Remove duplication, improve reuse

## Shared Rules
- Never place raw asset paths in widgets.
- Never place raw text in widgets.
- Never place raw colors in widgets.
- All spacing/radius/font sizes come from `AppDimens` / theme.
- One screen file = composition only; most UI in widgets folder.

## Networking Later (Must be easy)
- Repositories depend on datasources (local now, remote later)
- Switch strategy later by injecting remote datasource implementation
- Keep domain models independent of datasource formats

## Definition of Done (UI milestone)
- 4 screens match design composition.
- Bottom nav works (switches tabs).
- No network calls.
- Everything compiles and runs.
