import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
	final Function _addNewTransaction;

	TransactionForm(this._addNewTransaction);

	@override
	_TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
//	Function _addNewTransaction;
	final titleController = TextEditingController();
	final amountController = TextEditingController();
//	String title;

//	TransactionForm(Function _addNewTransaction) {
//		print('transaction-form:9');
//		print(title);
//
//		this._addNewTransaction = _addNewTransaction;
//		if (title.isNotEmpty) {
//			this.titleController.text = title;
//		}

//		if (amount > 0) {
//			this.amountController.text = amount.toString();
//		}
//	}

	void submitData() {
		final enteredText = this.titleController.text;
		double enteredAmount;

		print('transaction-form:24');
		print(enteredText);

		if (this.amountController.text.isEmpty) {
			enteredAmount = 0.00;
		} else {
			enteredAmount = double.parse(this.amountController.text);
		}

//		this.titleController.clear();
		if (enteredText.isNotEmpty || enteredAmount > 0) {
//			this._addNewTransaction(enteredText, enteredAmount);
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
//							onSubmitted: (_) => this.submitData(),
//							onChanged: (String e) {
//								print('changed');
//								print(e);
//								setState(() {
//									this.title = e;
//								});
//							},
						),
						TextField(
							controller: this.amountController,
							decoration: InputDecoration(
								hintText: 'Enter the amount for the transaction',
								labelText: 'Amount',
							),
							keyboardType: TextInputType.number,
//							onSubmitted: (_) => this.submitData(),
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