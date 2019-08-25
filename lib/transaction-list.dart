import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_expense/models/transaction.dart';

class TransactionList extends StatelessWidget {
	final List<Transaction> transactions;
	var context;

	TransactionList(this.transactions);

	Widget _getTransactionPrice(Transaction transaction) {
		return Container(
			child: Text(
				'\$${transaction.amount}',
				style: TextStyle(
					color: Theme.of(this.context).primaryColor,
					fontSize: 20,
					fontWeight: FontWeight.bold,
				),
			),
			decoration: BoxDecoration(
				border: Border.all(
					color: Theme.of(this.context).primaryColor,
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
		this.context = context;
		return Container(
			height: 300,
			child: ListView.builder(
				itemBuilder: (context, index) {
					return Card(
						child: Row(
							children: <Widget>[
								this._getTransactionPrice(this.transactions[index]),
								this._getTransactionDetails(this.transactions[index]),
							],
						),
					);
				},
				itemCount: this.transactions.length,
			),
		);
	}
}