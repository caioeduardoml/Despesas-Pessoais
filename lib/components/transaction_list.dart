import 'package:flutter/material.dart';
import 'package:expenses/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;
  
  const TransactionList(this.transactions, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: transactions.isEmpty ? Column(
        children: [
          const SizedBox(height: 20),
          Text(
            "Nenhuma transação encontrada",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 20),
          Image.asset(
            "assets/images/waiting.png",
            height: 200,
          ),
        ],
      ): ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index){
          final tr = transactions[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 2,
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "R\$ ${tr.value.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tr.title,
                      style: TextStyle(
                        fontFamily: "OpenSans",
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      DateFormat('d/MMM/y').format(tr.date),
                      style: TextStyle(color: Colors.grey.shade900),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}