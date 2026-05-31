import 'package:flutter/material.dart';
import 'package:week8workshop/models/expense_model.dart';
import 'package:week8workshop/widgets/chart_bar.dart';

class ChartBucket {
  const ChartBucket({
    required this.category,
    required this.expenses,
  });

  ChartBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses.where((expense) => expense.category == category).toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount;
    }

    return sum;
  }
}

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});

  final List<Expense> expenses;

  List<ChartBucket> get buckets {
    return [
      ChartBucket.forCategory(expenses, Category.food),
      ChartBucket.forCategory(expenses, Category.experience),
      ChartBucket.forCategory(expenses, Category.shopping),
      ChartBucket.forCategory(expenses, Category.stay),
    ];
  }

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
