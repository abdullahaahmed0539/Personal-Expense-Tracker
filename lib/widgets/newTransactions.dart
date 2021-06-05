import 'package:flutter/material.dart';

class NewTransactions extends StatelessWidget {
  
  final nameController = TextEditingController();
  final amountController = TextEditingController();
  final Function addUser;

  NewTransactions(this.addUser);
  
  @override
  Widget build(BuildContext context) {
    return Card(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(decoration: InputDecoration(labelText: 'Name'), controller: nameController ,),
                  TextField(decoration: InputDecoration(labelText: 'Amount'),controller: amountController,),
                  TextButton(onPressed: (){addUser(nameController.text, double.parse(amountController.text));}, child: Text('Add Transaction', style: TextStyle(color: Colors.lightGreen),), )
                ],),
            ) ,
      );
  }
}