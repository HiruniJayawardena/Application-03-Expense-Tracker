import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const  uuid = Uuid();

enum Category{food, travel, leisure, work}

const categoryIcons = {
  Category.food: Icons.fastfood,
  Category.travel: Icons.flight,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

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

  //we start the method with "get" as we transform some property
  /* getFormattedDate(){
    return '${date.day}/${date.month}/${date.year}';
  } */

 //we can use getter to get the formatted date
  String get formattedDate{
    return formatter.format(date);
  }
}