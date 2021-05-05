import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction.dart';

void main() => runApp(MyApp());

//abd
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatelessWidget {
  
  final List <Transaction> transactions = [
    Transaction(id: 't1', name: 'Car Service', amount: 90.55, date: DateTime.now()),
    Transaction(id: 't2', name: 'Grocery shopping', amount: 47.05, date: DateTime.now()),
    Transaction(id: 't3', name: 'Pay order', amount: 99.99, date: DateTime.now()),
  ];

  final nameController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo'),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[ 
          Container(
            width: double.infinity,
            child: Card(
              child: Text('Chart'),
            ),
          ),
          
          Card(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(decoration: InputDecoration(labelText: 'Name'), controller: nameController ,),
                  TextField(decoration: InputDecoration(labelText: 'Amount'),controller: amountController,),
                  TextButton(onPressed: (){print(nameController.text);print(amountController.text);}, child: Text('Add Transaction',style: TextStyle(color: Colors.lightGreen),), )
                ],),
            ) ,),

          Column(
            children: transactions.map((tx) { 
              return Card(
                child: Row(children: <Widget>[
                  Container(
                    child: Text(
                      '\$${tx.amount}',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                        fontSize: 20 ),
                    ),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.deepPurple, width: 2)
                    ),
                    padding: EdgeInsets.all(10),),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        tx.name.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        DateFormat.yMd().add_jm().format(tx.date),
                        style: TextStyle(
                          color: Colors.grey,
                        ),),
                    ],
                  ),
                ],),
              );
            }
            ).toList()
          )
          
          
        ],
      ),
    );
  }
}

