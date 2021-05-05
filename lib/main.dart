import 'package:flutter/material.dart';

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
    Transaction(id: 't1', name: 'Car Service', amount: 100.5, date: DateTime.now()),
    Transaction(id: 't2', name: 'Salary', amount: 10000000, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[ 
          Container(
            width: double.infinity,
            child: Card(
              child: Text('Chart'),
            ),
          ),
          Column(
            children: transactions.map((tx) { 
              return Card(
                child: Text(tx.name),
              );
            }
            ).toList()
          )
          
          
        ],
      ),
    );
  }
}

