import 'package:flutter/material.dart';

class NewTransactions extends StatefulWidget {
  
  final Function addUser;

  NewTransactions(this.addUser);

  @override
  _NewTransactionsState createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  final nameController = TextEditingController();

  final amountController = TextEditingController();

  void _submitData(){
    String name = nameController.text;
    double amount = double.parse(amountController.text);
    
    if(name.isEmpty || amount <= 0)
      return;

    widget.addUser(name, amount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Name'), 
                    controller: nameController,
                    onSubmitted: (_) => _submitData(),
                    ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    onSubmitted: (_) => _submitData(),
                    ),
                  TextButton(onPressed: _submitData, child: Text('Add Transaction', style: TextStyle(color: Colors.lightGreen),), )
                ],),
            ) ,
      );
  }
}