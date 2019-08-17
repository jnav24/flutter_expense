import 'package:flutter/material.dart';
import './transactions.dart';

class Home extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Expense Tracker'),
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
						Transactions(),
					],
					crossAxisAlignment: CrossAxisAlignment.stretch,
					mainAxisAlignment: MainAxisAlignment.start,
				),
			),
		);
	}
}