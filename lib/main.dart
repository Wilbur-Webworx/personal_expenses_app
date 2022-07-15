//Importing packages
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//Importing local files

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

  // String titleInput;
  // String amountInput;

  final titleController = TextEditingController();

  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Container(
                child: Text("CHART!!"),
              ),
              elevation: 5,
            ),
          ),
          Card(
            //Card containing textfields(UserInput)
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    //First Text Field
                    decoration: InputDecoration(
                      labelText: 'Title',
                    ),
                    controller: titleController,
                    // onChanged: (value) {
                    //   titleInput = value;
                    // },
                  ),
                  TextField(
                    // First Text Field
                    decoration: InputDecoration(
                      labelText: 'Amount',
                    ),
                    controller: amountController,
                    // onChanged: (value) {
                    //   amountInput = value;
                    // },
                  ),
                  FlatButton(
                    textColor: Colors.purple,
                    onPressed: () {
                      print(titleController.text);
                      print(amountController.text);
                    },
                    child: Text("Add Transaction"),
                  )
                ],
              ),
            ),
          ),
          Column(
            //Overall Column
            children: transactions
                .map(((tx) => Card(
                      child: Row(
                        //Price Row
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 15,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.purple,
                                width: 2,
                              ),
                            ),
                            padding: EdgeInsets.all(10),
                            child: Text(
                              //Amount of item
                              '\$${tx.amount}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                          Column(
                            //Title and date row, with two columns in it
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                //Title of item
                                tx.title,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                //Date of item
                                DateFormat.yMMMd()
                                    .format(tx.date), //tx.date.toString(),
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )))
                .toList(),
          ),
        ],
      ),
    );
  }
}
