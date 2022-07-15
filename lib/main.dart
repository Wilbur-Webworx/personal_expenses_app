import 'dart:ui';

import 'package:flutter/material.dart';
import './transaction.dart';

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
  final List<Transaction> transactions = [
    Transaction(
      id: "t1",
      title: "New Shoes",
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: "Weekly Groceries",
      amount: 16.53,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
          Column(
            children: transactions
                .map(((tx) => Card(
                      child: Row(
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
                                tx.date.toString(),
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
