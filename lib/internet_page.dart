import 'package:flutter/material.dart';
import 'transaction_history_page.dart';

class InternetPage extends StatefulWidget {
  @override
  _InternetPageState createState() => _InternetPageState();
}

class _InternetPageState extends State<InternetPage> {
  bool isCheckAll = false;
  bool isFirstChecked = false;
  bool isSecondChecked = false;
  bool showFirstDetails = false;
  bool showSecondDetails = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Internet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.yellow[100],
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(width: 1.0, color: const Color(0xFFE7B071)),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: Colors.yellow[700],
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      'Perlu diketahui, proses verifikasi transaksi dapat memakan waktu hingga 1x24 jam.',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            CheckboxListTile(
              activeColor: Colors.red,
              title: Text("Choose All"),
              value: isCheckAll,
              onChanged: (bool? value) {
                setState(() {
                  isCheckAll = value!;
                  isFirstChecked = value;
                  isSecondChecked = value;
                });
              },
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildBillItem(
                    'Rp450.000',
                    '16 Feb 2024',
                    isFirstChecked,
                        (value) {
                      setState(() {
                        isFirstChecked = value;
                        if (!value) isCheckAll = false;
                      });
                    },
                    showFirstDetails,
                        () {
                      setState(() {
                        showFirstDetails = !showFirstDetails;
                      });
                    },
                  ),
                  _buildBillItem(
                    'Rp240.000',
                    '20 Feb 2024',
                    isSecondChecked,
                        (value) {
                      setState(() {
                        isSecondChecked = value;
                        if (!value) isCheckAll = false;
                      });
                    },
                    showSecondDetails,
                        () {
                      setState(() {
                        showSecondDetails = !showSecondDetails;
                      });
                    },
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Transaction History'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TransactionHistoryPage()),
                );
              },
            ),
            SizedBox(height: 16.0),
            Divider(),
            ListTile(
              title: Text('Total Payment'),
              trailing: Text(
                  'Rp${(isFirstChecked ? 450000 : 0) + (isSecondChecked ? 240000 : 0)}'),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                child: Text('PAY NOW'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBillItem(
      String amount,
      String dueDate,
      bool isChecked,
      ValueChanged<bool> onChanged,
      bool showDetails,
      VoidCallback toggleDetails,
      ) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.account_balance_wallet),
            title: Text(amount),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Due date on $dueDate'),
                if (showDetails) _buildDetailSection(),
              ],
            ),
            trailing: Checkbox(
              activeColor: Colors.red,
              value: isChecked,
              onChanged: (bool? value) {
                onChanged(value!);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: toggleDetails,
                child: Text(showDetails ? 'Close' : 'See Details'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Provider: Nexhome'),
          Text('ID Pelanggan: 112345678921'),
          Text('Paket Layanan: Nexhome 100 Mbps'),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: InternetPage(),
  ));
}
