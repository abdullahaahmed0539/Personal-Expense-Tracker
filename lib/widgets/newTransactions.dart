import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransactions extends StatefulWidget {
  
  final Function addUser;

  NewTransactions(this.addUser);

  @override
  _NewTransactionsState createState() => _NewTransactionsState();

}

class _NewTransactionsState extends State<NewTransactions> {
  
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData(){
    if(_amountController.text.isEmpty){
      return;
    }

    String name = _nameController.text;
    double amount = double.parse(_amountController.text);
    
    if(name.isEmpty || amount <= 0 || _selectedDate == null)
      return;

    widget.addUser(name, amount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker(){
    showDatePicker(
      context: context,
      initialDate: DateTime.now(), 
      firstDate: DateTime(2021), 
      lastDate: DateTime.now() 
      )
      .then((pickedDate){
        if(pickedDate == null){
          return;
        }
        setState(() {
          _selectedDate = pickedDate;    
        });    
      });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.only(
                top: 10, 
                left: 10, 
                right: 10, 
                bottom: MediaQuery.of(context).viewInsets.bottom + 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                 children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Name'), 
                    controller: _nameController,
                    onSubmitted: (_) => _submitData(),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    onSubmitted: (_) => _submitData(),
                  ),
                  Container(
                    height: 70,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                          _selectedDate == null? 'No date chosen!': 'Picked date: ${DateFormat.yMd().format(_selectedDate)}'
                          )
                        ),
                        TextButton(
                          onPressed: _presentDatePicker, 
                          child: Text(
                            'Choose Date', 
                            style: TextStyle(
                              fontWeight: FontWeight.bold, 
                              color: Theme.of(context).primaryColor
                            ),
                          ),
                        )
                      ],
                    )
                  ),
                        // ignore: deprecated_member_use
                  RaisedButton(
                    onPressed: _submitData,
                    child: Text('Add Transaction'), 
                    color: Theme.of(context).primaryColor,
                    textColor: Theme.of(context).textTheme.button.color,
                  )
                ],
              ),
            ) ,
          ),
    );
      
  }
}