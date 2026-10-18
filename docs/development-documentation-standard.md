# Development Documentation Standard

## Purpose

Write documentation so another developer can understand the project quickly. Do not use comments to translate obvious syntax.

## Comment when

- A decision is not obvious from the code.
- A business rule or data shape needs context.
- A workaround or limitation exists.
- A flow or algorithm is difficult to follow.

## Do not comment when

- The comment only repeats the next line.
- It preserves an old implementation.
- It is a temporary personal note.

## Preferred style

```dart
// Keep the controller independent from the concrete data source.
```

Use JSDoc-style Dart documentation for public or complex APIs when the signature alone is not enough. Use `TODO` or `FIXME` for actionable follow-up and Git history for old implementations.

## Definition of done

- README explains purpose, setup, structure, data, and limitations.
- Business rules are documented separately when needed.
- Comments explain decisions rather than syntax.
- No secrets are committed.
- The project passes `flutter analyze` and `flutter test`.
