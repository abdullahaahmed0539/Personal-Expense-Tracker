import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';





class TransactionList extends StatelessWidget {
  
  final List <Transaction> transactions;

  TransactionList(this.transactions);
  
  @override
  Widget build(BuildContext context) {
    return Column(
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
          );
  }
}