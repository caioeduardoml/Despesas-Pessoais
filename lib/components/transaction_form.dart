import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {

  final void Function(String, double) onSubmit;

  const TransactionForm(this.onSubmit, {super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  void _submitForm(){
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if(title.isEmpty || value <= 0){
      return;
    }

    widget.onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      labelText: "Titulo",
                    ),
                  ),
                  TextField(
                    controller: valueController,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    onSubmitted: (_) => _submitForm(),
                    decoration: InputDecoration(
                      labelText: "Valor R\$",
                    ),
                  ),
                  TextButton(
                    onPressed: () => _submitForm(),
                    style:TextButton.styleFrom(
                      foregroundColor: Colors.purple,
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    child: Text("Adicionar"),
                  ),
                ],
              ),
            ),
          );
  }
}