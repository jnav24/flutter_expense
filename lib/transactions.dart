import 'package:flutter/material.dart';
import './transaction-form.dart';
import './transaction-list.dart';
import './models/transaction.dart';
import 'package:uuid/uuid.dart';

class Transactions extends StatefulWidget {
	@override
	_TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
	final uuid = new Uuid();
	List<Transaction> _transactionList;

	@override
	void initState() {
		super.initState();
		this._transactionList = [
			Transaction(id: this.uuid.v4(), title: 'New Shoes', amount: '69.99', date: DateTime.now()),
			Transaction(id: this.uuid.v4(), title: 'Groceries', amount: '54.99', date: DateTime.now()),
		];
	}

	void _addNewTransaction(String title, String amount) {
		if (title.isNotEmpty && num.parse(amount) > 0) {
			final newTransaction = Transaction(
				id: this.uuid.v4(),
				title: title,
				amount: amount,
				date: DateTime.now(),
			);

			this.setState(() {
				this._transactionList.add(newTransaction);
			});
		}
	}

	@override
	Widget build(BuildContext context) {
		return Column(
			children: <Widget>[
				TransactionForm(this._addNewTransaction),
				TransactionList(this._transactionList),
			],
		);
	}
}