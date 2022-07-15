import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  // const NewTransaction({Key key}) : super(key: key);
  final titleController = TextEditingController();
  final amountController = TextEditingController();

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
    );
  }
}
