import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  // const NewTransaction({Key key}) : super(key: key);
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle == "" || enteredAmount <= 0) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      //Card containing textfields(UserInput)
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              //First Text Field(Title)
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              controller: titleController,
              onSubmitted: (val) => submitData(),
              // onChanged: (value) {
              //   titleInput = value;
              // },
            ),
            TextField(
              // Second Text Field(Amount)
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (val) => submitData(),
              // onChanged: (value) {
              //   amountInput = value;
              // },
            ),
            TextButton(
              // textColor: Colors.purple,
              style: TextButton.styleFrom(
                primary: Colors.purple,
              ),
              onPressed: submitData,
              child: Text("Add Transaction"),
            )
          ],
        ),
      ),
    );
  }
}
