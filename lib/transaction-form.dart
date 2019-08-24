import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
	final Function _addNewTransaction;

	TransactionForm(this._addNewTransaction);

	@override
	_TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
	final titleController = TextEditingController();
	final amountController = TextEditingController();

	void submitData() {
		final enteredText = this.titleController.text;
		double enteredAmount;

		if (this.amountController.text.isEmpty) {
			enteredAmount = 0.00;
		} else {
			enteredAmount = double.parse(this.amountController.text);
		}

		if (enteredText.isNotEmpty || enteredAmount > 0) {
			widget._addNewTransaction(enteredText, enteredAmount);
		}
	}

	@override
	Widget build(BuildContext context) {
		return Card(
			child: Container(
				child: Column(
					children: <Widget>[
						TextField(
							controller: titleController,
							decoration: InputDecoration(
								hintText: 'Enter the title of the transaction',
								labelText: 'Title',
							),
						),
						TextField(
							controller: this.amountController,
							decoration: InputDecoration(
								hintText: 'Enter the amount for the transaction',
								labelText: 'Amount',
							),
							keyboardType: TextInputType.number,
						),
						FlatButton(
							child: Text('Add Transaction'),
							textColor: Colors.purple,
							onPressed: this.submitData,
						),
					],
					crossAxisAlignment: CrossAxisAlignment.end,
				),
				padding: EdgeInsets.all(10),
			),
			elevation: 5,
		);
	}
}