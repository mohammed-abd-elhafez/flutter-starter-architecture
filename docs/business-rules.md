# Business Rules

## Checklist completion

- A checklist item is either complete or incomplete.
- Tapping the row or checkbox toggles the same item.
- Progress equals completed items divided by total items.
- An empty checklist produces a progress value of `0` instead of dividing by zero.

## Data ownership

- The repository owns loading the dashboard snapshot.
- The controller owns UI state transitions and user-intent handling.
- Widgets only render values and report interactions.

## Future data source

The current repository is in-memory and intentionally resets on restart. A production repository may use an API or local database, but it must preserve the domain model contract so the presentation layer does not change unnecessarily.
