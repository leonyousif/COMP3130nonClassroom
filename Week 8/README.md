# Week 8 Workshop

This Flutter project continues the travel expenses app and introduces shared state management with Provider.

## What It Includes

- `ExpensesState` as a `ChangeNotifier` model
- Expense list and card widgets connected to provider state
- Chart and chart bar widgets for visualising expenses
- A bottom-sheet form for adding expenses
- Material 3 app styling

## Main Files

- `lib/main.dart`: app entry point and provider setup
- `lib/expenses.dart`: main expenses screen
- `lib/models/expenses_state.dart`: shared expense state
- `lib/widgets/chart.dart`: chart display
- `lib/widgets/new_expense.dart`: add-expense form

## Revisions

- Moved the Flutter project files directly into the `Week 8` folder so the weekly structure is consistent with the other workshop folders.
- Renamed the project package from the old Week 6 package name to `week8workshop`.
- Updated internal imports so Week 8 no longer references another week's package.
- Fixed the generated widget test so it matches the Week 8 app.
- Removed unused imports and deprecated theme settings reported by Flutter analysis.
- Added documentation comments for Provider state, charting, forms, lists, cards, and delete actions.
