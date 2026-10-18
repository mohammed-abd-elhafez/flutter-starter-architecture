# Architecture Decisions

## Use a repository contract before a real API

The app uses `DashboardRepository` even though the current source is mock data. This makes the data boundary visible from the beginning and keeps the UI independent from transport details.

## Use ChangeNotifier for this starter

`ChangeNotifier` is built into Flutter and is enough for one small interactive feature. Adding a third-party state package here would hide the architectural idea behind package setup. A larger product can replace the controller implementation without changing the domain models or repository contract.

## Keep widgets focused

The page coordinates layout, while `MetricCard` and `ChecklistCard` render repeatable pieces. This keeps repeated UI decisions in one place and gives future tests smaller targets.

## Prefer decision comments

Comments explain constraints and reasons, such as why the mock repository exists or why checklist progress handles an empty list. Comments do not narrate obvious widget construction.
