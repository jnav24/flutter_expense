import 'package:flutter/material.dart';
import './transaction-form.dart';
import './transaction-list.dart';

class Home extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
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
					TransactionForm(),
					TransactionList(),
				],
				crossAxisAlignment: CrossAxisAlignment.stretch,
				mainAxisAlignment: MainAxisAlignment.start,
			),
		);
	}
}