import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';

class ExpenseList extends StatelessWidget{
  const ExpenseList({
    super.key, 
    required this.expenses, 
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    /* we don't use list here because we don't know the number of items
    we can use scrollable list also
    but we use ListView.builder because it is more efficient
    and it is scrollable. */
    return ListView.builder(
      itemCount: expenses.length,
      // itemBuilder: (ctx, index) => ExpenseItem(expenses[index]),

      // Here we add dismissible to make the items swipe to delete
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]), // to make sure correct data that been deleted. we use this with dissmissible
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.7),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        onDismissed: (direction){
          onRemoveExpense(expenses[index]);
        },
        child: ExpenseItem(expenses[index]),
      ),
    );
  }
}