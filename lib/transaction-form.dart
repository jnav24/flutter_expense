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
		String enteredAmount;

		if (this.amountController.text.isEmpty) {
			enteredAmount = '0.00';
		} else {
			enteredAmount = double.parse(this.amountController.text).toStringAsFixed(2);
		}

		Map<dynamic, dynamic> res = widget._addNewTransaction(enteredText, enteredAmount);

		if (res['success']) {
			this.titleController.clear();
			this.amountController.clear();
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
							onSubmitted: (_) => this.submitData(),
						),
						TextField(
							controller: this.amountController,
							decoration: InputDecoration(
								hintText: 'Enter the amount for the transaction',
								labelText: 'Amount',
							),
							keyboardType: TextInputType.number,
							onSubmitted: (_) => this.submitData(),
						),
						FlatButton(
							child: Text('Add Transaction'),
							textColor: Colors.purple,
							onPressed: () {
								this.submitData();
								FocusScope.of(context).requestFocus(new FocusNode());
							},
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