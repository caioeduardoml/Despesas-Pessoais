import 'package:expenses/components/transaction_form.dart';
import 'package:flutter/material.dart';
import 'package:expenses/models/transaction.dart';
import '/components/transaction_list.dart';
import 'dart:math';


void main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const new({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple, secondary: Colors.amber),
        fontFamily: "Quicksand",
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: "OpenSans",
            fontSize: 24,
            fontWeight: FontWeight.bold
            ),
        ), 
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {

  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Transaction> _transactions = [
    // Transaction(id: "t1", title: "Sapato", value: 999, date: DateTime.now()),
    // Transaction(id: "t2", title: "Tenis", value: 700, date: DateTime.now()),
    // Transaction(id: "t3", title: "Camisa", value: 250, date: DateTime.now()),
  ];

  void _addTransaction(String title, double value) {
   final newTransaction = Transaction(
    id: Random().nextDouble().toString(), 
    title: title, 
    value: value, 
    date: DateTime.now()
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  void _opentransactionFormModal(BuildContext context){
    showModalBottomSheet(
      context: context, 
      builder: (_){
      return TransactionForm(_addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Despesas Pessoais"),
      actions: [
        IconButton(onPressed: () => _opentransactionFormModal(context), 
        icon: Icon(Icons.add)),
      ],
      foregroundColor: Colors.white,
      backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(color: Colors.blue, elevation: 5, child: Text("Grafico"),),
            TransactionList(_transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Colors.white,
        onPressed: () => _opentransactionFormModal(context),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
