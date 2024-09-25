import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';

class NewExpense extends StatefulWidget{
  const NewExpense({super.key});

  @override
  State<NewExpense> createState(){
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense>{
  // var _enteredTitle = '';

  // void _saveTitleInput(String inputValue){
  //   _enteredTitle = inputValue;
  // }

  final _titleController = TextEditingController(); 
  final _amountController = TextEditingController();
  DateTime? _selectedDate; // ? says that the value can be the type of DateTime or can be a null

  void _presentDatePicker() async { // we can only use async and await in future methods - this is the second way
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    final pickedDate = await showDatePicker(
      context: context, 
      initialDate: now,
      firstDate: firstDate, 
      lastDate: now,
    );
    /* ).then((value){ // get hold some value or some event in the future
    // using then is one way 
     }); */

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  void dispose() {  // need to dispose all the text editing controllers we create, otherwise it will crash the application.
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding( 
      padding: const EdgeInsets.all(7),
      child: Column( // we don't use ListView because we don't need to scroll, generate content dynamically
        children: [
          TextField(
            // onChanged: _saveTitleInput,
            controller: _titleController, // for multiple fields we need multiple controllers
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded( // we use expanded to avoid confusions, this take the sapace as they can
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$ ',
                    label: Text('Amount'),
                  ),
                ),
              ),
              
              const SizedBox(width: 16,),
              Expanded( // because we add row inside a row
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_selectedDate == null ? 'No date selected' : formatter.format(_selectedDate!)), // we use "!" to force dart that this wont be null
                    IconButton(
                      onPressed: _presentDatePicker, 
                      icon: const Icon(
                        Icons.calendar_month_rounded
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
           children: [
            DropdownButton(
              items: Category.values.map(
                (category) => DropdownMenuItem(
                  value: category,
                  child: Text(
                    category.name.toString(),
                  ),),
              ).toList(), 
              onChanged:(value){},
            ),
            TextButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: (){
                print(_titleController.text);
                print(_amountController.text);
              }, 
              child: const Text('Save Expense'),
            ),
          ],
          ),
        ],
      ),
    );
  }
}