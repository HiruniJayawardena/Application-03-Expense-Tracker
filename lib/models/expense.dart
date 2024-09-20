import 'package:uuid/uuid.dart';

const  uuid = Uuid();

enum Category{
  food,
  travel, 
  leisure,
  work
}

class Expense{
  Expense({ // we use named paramters because we don't want to remember the order of the parameters
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    // we don't add id here because we need to generate a new id when ever new expense object created
  }) : id = uuid.v4(); // generate a new id when ever new expense object created

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category; 
}