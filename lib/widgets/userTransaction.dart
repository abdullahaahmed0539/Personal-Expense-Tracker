import 'package:flutter/material.dart';

import './newTransactions.dart';
import './transactionList.dart';
import '../models/transaction.dart';


class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  
  final List <Transaction> transactions = [
    Transaction(
      id: 't1',
      name: 'Car Service', 
      amount: 90.55, 
      date: DateTime.now()
    ),
    Transaction(
      id: 't2', 
      name: 'Grocery shopping', 
      amount: 47.05, 
      date: DateTime.now()
    ),
    Transaction(
      id: 't3', 
      name: 'Pay order', 
      amount: 99.99, 
      date: DateTime.now()
    ),
  ];

  void _addUser(String newName, double newAmount){
    final newTx = Transaction(id: 't3', name: newName, amount: newAmount, date: DateTime.now());
    setState(() {
      transactions.add(newTx);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransactions(_addUser),
        TransactionList(transactions),
      ],
    );
  }
}