import 'package:flutter/material.dart';

import './newTransactions.dart';
import './transactionList.dart';
import '../models/transaction.dart';


class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  
  final List <Transaction> transactions = [];

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