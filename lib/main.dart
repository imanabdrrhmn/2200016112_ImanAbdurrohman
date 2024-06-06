import 'package:flutter/material.dart';
import 'internet_page.dart';
import 'transaction_history_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Internet Payment App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InternetPage(),
      routes: {
        '/transaction-history': (context) => TransactionHistoryPage(),
      },
    );
  }
}
