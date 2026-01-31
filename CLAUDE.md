# Farm Game (Flutter + Flame) — Claude Instructions

You are an expert Flutter/Flame engineer. Produce clean, maintainable, scalable code.

## Product Context
We are building a cozy 2D farm/factory game.
- Tabs: Farm, Factory, Store, Friends
- Initial milestone: UI-only (no networking). Later: add network without rewriting architecture.
- Tech: Flutter UI + Flame for gameplay scenes (later), Provider for state management.

## UI Design Source of Truth (IMPORTANT)
There are multiple screenshots in the `ui_design/` folder. You MUST:
1) Enumerate ALL screens present in `ui_design/` (every image file).
2) Create a screen/widget for each design screenshot (even if partially implemented).
3) Add an `AppAssets` entry for every screenshot-related asset/background/icon you reference.
4) If a design is unclear, implement the closest composition and mark TODO only for missing details.
5) Keep the app navigable: every designed screen must be reachable via route or via a temporary debug menu.

## Non-negotiable Rules
1. Clean code: small files, single responsibility, meaningful names, no god widgets.
2. NO hardcoded values:
   - All colors -> `AppColors`
   - All text -> `AppStrings`
   - All dimensions/padding/radius -> `AppDimens`
   - All asset paths -> `AppAssets`
3. Reusable widgets:
   - If something appears 2+ times, make a widget.
4. Theme first:
   - Use `ThemeData` via `AppTheme.light()`
   - Text styles via `AppTextStyles`
5. Provider only:
   - Use `ChangeNotifier` + `ChangeNotifierProvider`
   - Avoid global mutable singletons.
6. Offline-first architecture (flexible for later networking):
   - Repositories expose domain methods.
   - Data sources: Local (now), Remote (later).
   - UI depends on Provider/ViewModel, not on repositories directly.
7. Folder structure must match what’s defined in this doc (see below).
8. Assets are placeholders now:
   - Use `AppAssets.*` constants everywhere.
   - Assume assets exist; do not inline strings like "assets/..".
9. Do not ignore extra UI designs. Every screenshot in `ui_design/` must map to a Flutter screen file.


## Folder Structure (must follow)
lib/
  app/
    app.dart
    routes.dart
  core/
    constants/
      app_assets.dart
      app_colors.dart
      app_dimens.dart
      app_strings.dart
    theme/
      app_theme.dart
      app_text_styles.dart
    widgets/
      app_scaffold.dart
      bottom_nav_bar.dart
      title_banner.dart
      resource_bar.dart
      panel_card.dart
      primary_button.dart
      inventory_slot.dart
  features/
    navigation/
      nav_provider.dart
      nav_tab.dart
    farm/
      presentation/
        screens/
          farm_main_screen.dart
          chicken_barn_screen.dart
        widgets/
          farm_building_card.dart
          grass_patch_widget.dart
      domain/
        models/
          building.dart
          resource.dart
      data/
        repositories/
          farm_repository_impl.dart
        datasources/
          farm_local_datasource.dart
          farm_remote_datasource.dart
    factory/
      presentation/
        screens/
          factory_main_screen.dart
          cake_factory_screen.dart
        widgets/
          recipe_row.dart
          factory_building_card.dart
      domain/
        models/
          recipe.dart
          inventory_item.dart
      data/
        repositories/
          factory_repository_impl.dart
        datasources/
          factory_local_datasource.dart
          factory_remote_datasource.dart
  main.dart

ui_design/
  (screens implemented here as Flutter screens; no Flame yet)

## UI Implementation Notes
- Build screens to match the provided UI images:
  1) Farm main: “WELCOME TO FARM” with buildings (Chicken/Sheep/Cow/Pig barns), clouds, bottom nav
  2) Factory main: “WELCOME TO FACTORY” background with stations, bottom nav
  3) Cake Factory inside: title “CAKE FACTORY”, building art, recipe panel with "+" and “MAKE CAKE”, inventory panel, bottom nav
  4) Chicken Barn inside: title “CHICKEN BARN”, top resource bars, chickens + eggs on grass, bottom nav
- Use layered layout:
  - Background (image)
  - Decorative clouds (image widgets)
  - Title banner (reusable)
  - Content cards/panels (reusable)
  - Bottom nav (reusable)
  5) and other screen inside folder ui_design/

## Output Requirements
- Provide complete compilable code.
- Prefer `const` constructors.
- Keep widgets small; split into files.
- Do not add networking yet; only stubs for remote data sources.
- Add TODO markers only when truly needed.

If any ambiguity exists, make reasonable assumptions and proceed.
