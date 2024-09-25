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
  Category _selectedCategory = Category.leisure;

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

  void _submitExpenseData(){
    final enteredAmount = double.tryParse(_amountController.text); // tryParse('Hello') => null , tryParse('1.12') => 1.12
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    if(_titleController.text.trim().isEmpty || amountIsInvalid || _selectedDate == null){
      showDialog(
        context: context, 
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input!'),
          content: const Text('Please make sure a valid title, amount, date and category was entered...'),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }
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
          const SizedBox(height: 16,),
          Row(
           children: [
            DropdownButton( // we can't add controller to the drop down menus
              value: _selectedCategory,
              items: Category.values.map(
                (category) => DropdownMenuItem(
                  value: category,
                  child: Text(
                    category.name.toUpperCase(),
                  ),),
              ).toList(), 
              onChanged:(value){
                if(value == null){
                  return;
                }
                setState((){
                  _selectedCategory = value;
                });
              },
            ),
            const Spacer(),
            TextButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: _submitExpenseData, 
              child: const Text('Save Expense'),
            ),
          ],
          ),
        ],
      ),
    );
  }
}