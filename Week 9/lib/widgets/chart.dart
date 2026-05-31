import 'package:flutter/material.dart';
import 'package:week9workshop/models/expense_model.dart';
import 'package:week9workshop/widgets/chart_bar.dart';

/// Groups expenses by category so the chart can total each bucket.
class ChartBucket {
  const ChartBucket({
    required this.category,
    required this.expenses,
  });

  /// Builds a bucket by filtering all expenses for one category.
  ChartBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses.where((expense) => expense.category == category).toList();

  final Category category;
  final List<Expense> expenses;

  /// Calculates the total amount spent in this category bucket.
  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount;
    }

    return sum;
  }
}

/// Displays category spending as proportional vertical chart bars.
class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});

  final List<Expense> expenses;

  /// Creates one chart bucket per expense category.
  List<ChartBucket> get buckets {
    return [
      ChartBucket.forCategory(expenses, Category.food),
      ChartBucket.forCategory(expenses, Category.experience),
      ChartBucket.forCategory(expenses, Category.shopping),
      ChartBucket.forCategory(expenses, Category.stay),
    ];
  }

  /// Finds the largest bucket total so bars can be scaled consistently.
  double get maxTotalExpense {
    double maxTotalExpense = 0;

    for (final bucket in buckets) {
      if (bucket.totalExpenses > maxTotalExpense) {
        maxTotalExpense = bucket.totalExpenses;
      }
    }

    return maxTotalExpense;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.tertiaryContainer,
            theme.colorScheme.primaryContainer,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          for (final bucket in buckets)
            Expanded(
              child: ChartBar(
                fill: maxTotalExpense == 0
                    ? 0
                    : bucket.totalExpenses / maxTotalExpense,
                label: bucket.category.name,
                icon: categoryIcons[bucket.category]!,
              ),
            ),
        ],
      ),
    );
  }
}
