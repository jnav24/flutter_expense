import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		final titleController = TextEditingController();
		final amountController = TextEditingController();

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
							controller: amountController,
							decoration: InputDecoration(
								hintText: 'Enter the amount for the transaction',
								labelText: 'Amount',
							),
						),
						FlatButton(
							child: Text('Add Transaction'),
							textColor: Colors.purple,
							onPressed: () {},
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