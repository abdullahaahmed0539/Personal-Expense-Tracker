import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  
  final List <Transaction> transactions;


  TransactionList(this.transactions);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: transactions.isEmpty? Column(
        children: <Widget> [
          Text('No transactions yet!', style: Theme.of(context).textTheme.headline6),
          SizedBox(height: 40,),
          Container(height: 300, child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover)),
        ]
      ) : ListView.builder(
        itemBuilder: (ctx, index){
            return Card(
              child: Row(children: <Widget>[
                
                Container(
                  child: Text(
                    '\$${transactions[index].amount.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20 
                      ),
                  ),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).primaryColor, width: 2)
                  ),
                  padding: EdgeInsets.all(10),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    
                    Text(
                      transactions[index].name.toString(),
                      style: Theme.of(context).textTheme.headline6,
                    ),
                          
                    Text(
                      DateFormat.yMd().add_jm().format(transactions[index].date),
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  
                  ],
                      
                ),
              
                ],

              ),

            );
          },
          itemCount: transactions.length,
      ),
    );
  }
}