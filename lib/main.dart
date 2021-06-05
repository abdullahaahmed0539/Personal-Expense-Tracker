import 'package:flutter/material.dart';

import './models/transaction.dart';
import './widgets/transactionList.dart';
import './widgets//newTransactions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  final List <Transaction> transactions = [];

  void _addUser(String newName, double newAmount){
    final newTx = Transaction(id: 't3', name: newName, amount: newAmount, date: DateTime.now());
    setState(() {
      transactions.add(newTx);
    });
    print(transactions);
  }
  
  
  
  void _startAddNewTransaction( BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (_){
      return GestureDetector(
        child: NewTransactions(_addUser), 
        onTap: (){},
        behavior: HitTestBehavior.opaque,
      );

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo'),
        backgroundColor: Colors.purple,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: () => _startAddNewTransaction(context))
        ],
      ),
      body: SingleChildScrollView(
              child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[ 
            Container(
              width: double.infinity,
              child: Card(
                child: Text('Chart'),
              ),
            ),
            
        TransactionList(transactions),

              
            
            
          ],
        ),
      ),
      
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add), onPressed: () => _startAddNewTransaction(context), backgroundColor: Colors.purple,),
      
    );
  }
}

