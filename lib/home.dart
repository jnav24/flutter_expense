import 'package:flutter/material.dart';
import './transaction-form.dart';
import './transaction-list.dart';
import 'package:uuid/uuid.dart';
import './models/transaction.dart';

class Home extends StatefulWidget {
	@override
	_HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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

	Map<dynamic, dynamic> _addNewTransaction(String title, String amount) {
		Map result = {
			'success': false
		};

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

			result['success'] = true;
		}

		return result;
	}

	void _addNewTransactionModal(String title, String amount) {
		final res = this._addNewTransaction(title, amount);

		if (res['success']) {
			Navigator.of(context).pop();
		}
	}

	void _startAddNewTransaction(BuildContext ctx) {
		showModalBottomSheet(
			context: ctx,
			builder: (_) {
				return GestureDetector(
					behavior: HitTestBehavior.opaque,
					child: TransactionForm(this._addNewTransactionModal),
					onTap: () {},
				);
			}
		);
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Expense Tracker'),
				actions: <Widget>[
					IconButton(
						icon: Icon(Icons.add),
						onPressed: () {
							this._startAddNewTransaction(context);
						},
					),
				],
			),
			body: SingleChildScrollView(
				child: Column(
					children: <Widget>[
						Card(
							child: Container(
								child: Text('Chart'),
								margin: EdgeInsets.all(10),
								width: MediaQuery.of(context).size.width / 1.25,
							),
							elevation: 5,
						),
						TransactionList(this._transactionList),
					],
					crossAxisAlignment: CrossAxisAlignment.stretch,
					mainAxisAlignment: MainAxisAlignment.start,
				),
			),
			floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
			floatingActionButton: FloatingActionButton(
				child: Icon(Icons.add),
				onPressed: () {
					this._startAddNewTransaction(context);
				},
			),
		);
	}
}