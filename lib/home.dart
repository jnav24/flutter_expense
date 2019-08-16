import 'package:flutter/material.dart';
import './transaction-list.dart';

class Home extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		final titleController = TextEditingController();
		final amountController = TextEditingController();

		return Scaffold(
			appBar: AppBar(
				title: Text('Expense Tracker'),
			),
			body: Column(
				children: <Widget>[
					Card(
						child: Container(
							child: Text('Chart'),
							margin: EdgeInsets.all(10),
							width: MediaQuery.of(context).size.width / 1.25,
						),
						elevation: 5,
					),
					Card(
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
					),
					TransactionList(),
				],
				crossAxisAlignment: CrossAxisAlignment.stretch,
				mainAxisAlignment: MainAxisAlignment.start,
			),
		);
	}
}