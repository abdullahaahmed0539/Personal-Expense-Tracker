import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:flutter_application_1/widgets/chart.dart';

import './models/transaction.dart';
import './widgets/transactionList.dart';
import './widgets/newTransactions.dart';
import './widgets/chart.dart';

void main() {
  /*
  FOR ENSURING THAT ALWAYS IN PORTRAIT 
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
   */ 
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
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
          ),
          button: TextStyle(
            color: Colors.white
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
  
  final List <Transaction> _transactions = [];


  bool _showChart = false;

  List<Transaction> get _recentTransactions{
    return _transactions.where((tx){
      return tx.date.isAfter(
        DateTime.now().subtract(Duration(days: 7))
      );
    }).toList();
  }

  void _addUser(String newName, double newAmount, DateTime chosenDate){
    final newTx = Transaction(id: chosenDate.toString(), name: newName, amount: newAmount, date: chosenDate);
    setState(() {
      _transactions.add(newTx);
    });
  }

  void _deleteTransaction (String id){
    setState(() {
      _transactions.removeWhere((tx) => tx.id == id);      
    });
  }
  
  void _startAddNewTransaction( BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (_){
      return GestureDetector(
        child: NewTransactions(_addUser), 
        behavior: HitTestBehavior.opaque,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandScape = mediaQuery.orientation == Orientation.landscape;
    final PreferredSizeWidget appBar = Platform.isIOS ? 
    CupertinoNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      middle: Text('Personal Expenses', style: TextStyle(color: CupertinoColors.white),),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
        GestureDetector(
          child: Icon(CupertinoIcons.add, color: CupertinoColors.white,),
          onTap: () => _startAddNewTransaction(context),
        )
      ],),
    ) : AppBar(
        title: Text('Personal Expenses',),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: () => _startAddNewTransaction(context))
        ],
      );

      final txListWidget = Container(
            height: (mediaQuery.size.height
             - appBar.preferredSize.height
             -mediaQuery.padding.top) * 0.7,
            child: TransactionList(_transactions, _deleteTransaction)
            );

      final pageBody = SafeArea(child: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[ 
          if (isLandScape) Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Show Chart', style: Theme.of(context).textTheme.headline6 ,),
              Switch.adaptive(
                value: _showChart, 
                activeColor: Theme.of(context).accentColor,
                onChanged: (val){
                setState(() {
                  _showChart = val;                  
                });
              })
            ],
          ),
          if (!isLandScape) Container(
            height: (mediaQuery.size.height 
            - appBar.preferredSize.height
            -mediaQuery.padding.top) * 0.3,
            child: Chart(
              _recentTransactions
            )
          ),
          if(!isLandScape) txListWidget,
          if(isLandScape) _showChart
          ? Container(
            height: (mediaQuery.size.height 
            - appBar.preferredSize.height
            -mediaQuery.padding.top) * 0.7,
            child: Chart(
              _recentTransactions
            )
          ): txListWidget
        ],
        ),
      ),
      );

    return Platform.isIOS? CupertinoPageScaffold(
      child: pageBody,
      navigationBar: appBar,): Scaffold(
      appBar: appBar,
      body: pageBody,
      floatingActionButton: Platform.isIOS ? Container() :FloatingActionButton(
        child: Icon(Icons.add), 
        onPressed: () => _startAddNewTransaction(context), 
      ),
    );
  }

}

