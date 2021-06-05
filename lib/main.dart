import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/userTransaction.dart';

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


class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo'),
        backgroundColor: Colors.purple,
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
            
            UserTransactions(),

              
            
            
          ],
        ),
      ),
      
      
    );
  }
}

