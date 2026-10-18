# Architecture

## Structure

The project uses a feature-first layout. Code that belongs to the dashboard stays under `features/dashboard`, while cross-feature concerns live under `core`.

```text
presentation -> domain <- data
```

- **Presentation** renders widgets and coordinates user intent.
- **Domain** contains models and concepts that should not depend on Flutter UI.
- **Data** implements repository contracts and owns the current data source.
- **Core** contains shared theme and infrastructure used by more than one feature.

## State flow

1. `StarterApp` composes the concrete `MockDashboardRepository`.
2. `DashboardController` receives the repository contract.
3. The controller exposes loading, error, snapshot, and progress state.
4. `DashboardPage` rebuilds from the controller without knowing where data came from.
5. User actions call controller methods; the controller updates immutable models and notifies listeners.

## Why this is a starter

The structure is intentionally small. It demonstrates boundaries without introducing a dependency framework or multiple abstractions that the current feature does not need. As the product grows, routing, persistence, and a larger state solution can be added behind the same boundaries.
