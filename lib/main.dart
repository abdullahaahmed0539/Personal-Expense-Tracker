import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/chart.dart';

import './models/transaction.dart';
import './widgets/transactionList.dart';
import './widgets/newTransactions.dart';
import './widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
          headline6: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 18,
              fontWeight: FontWeight.bold
            )
        ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
              fontFamily: 'Open Sans',
              fontSize: 20,
              fontWeight: FontWeight.bold
            )
          )
        )
      ),
    );
  }
}


class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  final List <Transaction> _transactions = [
  ];
  List<Transaction> get _recentTransactions{
    return _transactions.where((tx){
      return tx.date.isAfter(
        DateTime.now().subtract(Duration(days: 7))
      );
    }).toList();
  }

  void _addUser(String newName, double newAmount){
    final newTx = Transaction(id: 't3', name: newName, amount: newAmount, date: DateTime.now());
    setState(() {
      _transactions.add(newTx);
    });
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
        title: Text('Personal Expenses'),
        // backgroundColor: Colors.purple,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: () => _startAddNewTransaction(context))
        ],
      ),
      body: SingleChildScrollView(
              child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[ 
            Chart(_recentTransactions),
            TransactionList(_transactions),

              
            
            
          ],
        ),
      ),
      
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add), onPressed: () => _startAddNewTransaction(context), ),
      
    );
  }
}

