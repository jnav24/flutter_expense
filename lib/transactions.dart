import 'package:flutter/material.dart';
import './transaction-form.dart';
import './transaction-list.dart';

class Transactions extends StatefulWidget {
	@override
	_TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
	@override
	Widget build(BuildContext context) {
		return Column(
			children: <Widget>[
				TransactionForm(),
				TransactionList(),
			],
		);
	}
}