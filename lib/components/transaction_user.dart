import 'package:flutter/material.dart';
import 'package:expenses/models/transaction.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';
import 'dart:math';

class TransactionUser extends StatefulWidget {
  const new({super.key});

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final transactions = [
    Transaction(id: "t1", title: "Sapato", value: 999, date: DateTime.now()),
    Transaction(id: "t2", title: "Tenis", value: 700, date: DateTime.now()),
    Transaction(id: "t3", title: "Camisa", value: 250, date: DateTime.now()),
  ];

  _addTransaction(String title, double value) {
   final newTransaction = Transaction(
    id: Random().nextDouble().toString(), 
    title: title, 
    value: value, 
    date: DateTime.now()
    );

    setState(() {
      transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(transactions),
        TransactionForm(_addTransaction),
      ],
    );
  }
}