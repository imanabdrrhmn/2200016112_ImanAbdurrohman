import 'package:flutter/material.dart';
import 'package:internet_feature/transaction_details_page.dart';

class TransactionHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Internet / Transaction History'),
      ),
      body: ListView(
        children: [
          _buildTransactionItem(context, 'Nexhome', '15 Feb 2024', 'Rp455.000'),
          _buildTransactionItem(context, 'Bizzcom', '14 Feb 2024', 'Rp245.000'),
          _buildTransactionItem(context, 'Bizzcom', '16 Jan 2024', 'Rp455.000'),
          _buildTransactionItem(context, 'Nexhome', '13 Jan 2024', 'Rp455.000'),
          _buildTransactionItem(context, 'Bizzcom', '14 Dec 2024', 'Rp245.000'),
        ],
      ),
    );
  }

  Widget _buildTransactionItem(BuildContext context, String provider, String date, String amount) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.account_balance_wallet),
        title: Text(provider),
        subtitle: Text(date),
        trailing: Text(amount),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TransactionDetailsPage()),
          );
        },
      ),
    );
  }
}
