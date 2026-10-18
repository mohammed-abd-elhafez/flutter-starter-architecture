# Flutter Starter Architecture

A small, polished Flutter starter that demonstrates a feature-first structure, explicit UI state, dependency inversion, and documentation that explains decisions instead of repeating syntax.

## Overview

Project Atlas is a dashboard-style reference app for starting future Flutter products with intention. It uses a mock repository today, but the presentation layer already depends on a repository contract so a real API or database can be introduced without rewriting the screen.

## Features

- Feature-first dashboard structure.
- Material 3 dark theme with centralized design tokens.
- Loading, success, and error states.
- Interactive architecture checklist.
- Reusable metric and checklist widgets.
- Immutable domain models.
- Unit and widget tests.
- Project documentation and architecture decisions.

## Technologies

- Flutter 3.47+
- Dart 3.13+
- Material 3
- `ChangeNotifier` for the small demo state layer
- No third-party runtime dependencies

## Run locally

```bash
flutter pub get
flutter run -d chrome
```

To run the tests and static analysis:

```bash
flutter test
flutter analyze
```

## Project structure

```text
lib/
├── app.dart
├── main.dart
├── core/
│   └── theme/
│       └── app_theme.dart
└── features/
    └── dashboard/
        ├── data/
        │   └── dashboard_repository.dart
        ├── domain/
        │   └── dashboard_models.dart
        └── presentation/
            ├── dashboard_controller.dart
            ├── dashboard_page.dart
            └── widgets/
                ├── checklist_card.dart
                └── metric_card.dart
```

## Documentation

- [Architecture](docs/architecture.md)
- [Business rules](docs/business-rules.md)
- [Architecture decisions](docs/decisions.md)
- [Development documentation standard](docs/development-documentation-standard.md)

## Data and storage

The current app uses `MockDashboardRepository` as an in-memory data source. There is no API key, database, or local persistence in this starter. The repository contract is the seam where a production data source can be added.

## Known limitations

- The dashboard data resets when the app restarts.
- The menu button is intentionally a visual placeholder for future navigation.
- The project does not include authentication or remote persistence.

## Future improvements

- Add a real repository implementation backed by an API or SQLite.
- Introduce routing when the app grows beyond one feature.
- Add a design-system component catalog.
- Add integration tests for the production data source.

## Documentation standard

This repository follows a simple rule: comments should explain decisions, constraints, and business logic. Clear code should not be surrounded by comments that merely translate syntax.
