import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_expense/models/transaction.dart';

class TransactionList extends StatelessWidget {
	final List<Transaction> transactions = [
		Transaction(id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
		Transaction(id: 't2', title: 'Groceries', amount: 54.99, date: DateTime.now()),
	];

	Widget _getTransactionPrice(Transaction transaction) {
		return Container(
			child: Text(
				'\$${transaction.amount}',
				style: TextStyle(
					color: Colors.purple,
					fontSize: 20,
					fontWeight: FontWeight.bold,
				),
			),
			decoration: BoxDecoration(
				border: Border.all(
					color: Colors.purple,
					width: 2,
				),
			),
			margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
			padding: EdgeInsets.all(10),
		);
	}

	Widget _getTransactionDetails(Transaction transaction) {
		return Column(
			children: <Widget>[
				Text(
					transaction.title,
					style: TextStyle(
						fontSize: 18,
						fontWeight: FontWeight.bold,
					),
				),
				Text(
					DateFormat('yMMMMd').format(transaction.date),
					style: TextStyle(
						color: Colors.grey,
					),
				),
			],
			crossAxisAlignment: CrossAxisAlignment.start,
		);
	}

	@override
	Widget build(BuildContext context) {
		return Column(
			children: <Widget>[
				...this.transactions.map((transaction) {
					return Card(
						child: Row(
							children: <Widget>[
								this._getTransactionPrice(transaction),
								this._getTransactionDetails(transaction),
							],
						),
					);
				}).toList()
			],
		);
	}
}