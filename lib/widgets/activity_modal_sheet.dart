import 'package:flutter/material.dart';

import '../color.dart';

class ActModalSheet extends StatelessWidget {
  const ActModalSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15)
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const SizedBox(height: 20,),
          const Padding(
            padding: EdgeInsets.only(top: 20, left: 20, bottom: 10),
            child: Text('Select a Wallet',
              style:  TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87
              ),
            ),
          ),
          const SizedBox(height: 10,),
          const Divider(),
          const SizedBox(height: 10,),
          ListTile(
            leading:  const Icon(Icons.account_balance_wallet_rounded, color: secondaryColor,),
            title:  const Text('All Wallets',
              style:  TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87
              ),
            ),
            subtitle: const Text(
              'Total Balance',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey
              ),
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                 Text('\$0.00',
                  style:  TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87
                  ),
                ),
                  
                Text(
                  'USD',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey
                  ),
                ),
                  
              ],
            ),
      
          )
      
      
        ],
      ),
    );
  }
}
