import 'package:blockchain/color.dart';
import 'package:blockchain/widgets/activity_modal_sheet.dart';
import 'package:flutter/material.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Activity",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.qr_code_scanner_rounded,
                color: Colors.grey,
                size: 30,
              )),
          const SizedBox(width: 5),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.person_rounded,
                color: Colors.grey,
                size: 30,
              )),
        ],
      ),
      body: Column(
        children: [
          ListTile(
            leading: const Icon(
              Icons.account_balance_wallet_rounded,
              color: secondaryColor,
            ),
            title: const Text(
              'All Wallets',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
            subtitle: const Text(
              '\$0.00 USD',
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            trailing: const Icon(Icons.keyboard_arrow_down_rounded),
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) => const ActModalSheet());
            },
          ),
          const SizedBox(
            height: 70,
          ),
          const Center(
            child: Text(
              'You Have No Activity',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 15),
          const Center(
            child: Text('All your transactions will show up here.',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
          )
        ],
      ),
    );
  }
}
