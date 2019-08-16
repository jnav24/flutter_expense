import 'package:flutter/material.dart';
import './transaction.dart';

class Home extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		final List<Transaction> transactions = [
			Transaction(id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
			Transaction(id: 't2', title: 'Groceries', amount: 54.99, date: DateTime.now()),
		];

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
					Column(
						children: <Widget>[
							...transactions.map((transaction) {
								return Card(
									child: Container(
										child: Text(transaction.title),
										width: 100,
									),
								);
							}).toList()
						],
					)
				],
				crossAxisAlignment: CrossAxisAlignment.center,
				mainAxisAlignment: MainAxisAlignment.center,
			),
		);
	}
}