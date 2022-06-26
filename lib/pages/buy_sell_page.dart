import 'package:blockchain/color.dart';
import 'package:blockchain/widgets/button.dart';
import 'package:flutter/material.dart';

import '../widgets/sliver_header.dart';
import 'settings_page.dart';

class BuyNSell extends StatefulWidget {
  const BuyNSell({Key? key}) : super(key: key);

  @override
  State<BuyNSell> createState() => _BuyNSellState();
}

class _BuyNSellState extends State<BuyNSell> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Buy & Sell",
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
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const SettingsPage())
                  );
                },
                icon: const Icon(
                  Icons.person_rounded,
                  color: Colors.grey,
                  size: 30,
                )),
          ],
          bottom: const TabBar(indicatorColor: secondaryColor,
              tabs: [
            Tab(
              child: Text(
                'Buy',
                style: TextStyle(
                    color: secondaryColor, fontWeight: FontWeight.w500),
              ),
            ),
            Tab(
              child: Text(
                'Sell',
                style: TextStyle(
                    color: secondaryColor, fontWeight: FontWeight.w500),
              ),
            ),
          ]),
        ),
        body: const TabBarView(children: [BuyTab(), SellTab()]),
      ),
    );
  }
}

class BuyTab extends StatefulWidget {
  const BuyTab({Key? key}) : super(key: key);

  @override
  _BuyTabState createState() => _BuyTabState();
}

class _BuyTabState extends State<BuyTab> {
  final List<String> currencyName = [
    "Bitcoin",
    "Ether",
    "Dogecoin",
    "Bitcoin Cash",
    "ChainLink",
    "Algorand",
    "Litecoin",
    "Solana",
    "Cardano",
    "Xpr",
    "Tether"
  ];

  final List<double> price = [
    38882.47,
    2556.35,
    0.11330,
    287.28,
    13.06,
    0.70,
    104.60,
    79.90,
    0.80100,
    0.78690,
    1.00
  ];

  final List<double> percentage = [
    0.06,
    0.45,
    0.28,
    0.82,
    3.59,
    0.98,
    1.56,
    0.25,
    0.90,
    1.69,
    0.57
  ];

  List<String> images = [
    "assets/bitcoin-btc-logo.png",
    "assets/ethereum-eth-logo.png",
    "assets/dogecoin-doge-logo.png",
    "assets/bitcoin-cash-bch-logo.png",
    "assets/chainlink-link-logo.png",
    "assets/algorand-algo-logo.png",
    "assets/litecoin-ltc-logo.png",
    "assets/solana-sol-logo.png",
    "assets/cardano-ada-logo.png",
    "assets/xrp-xrp-logo.png",
    "assets/tether-usdt-logo.png"
  ];
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverHeader(),
        SliverList(
          delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
            return ListTile(
              leading: Image.asset(
                images[index],
                scale: 2,
              ),
              title: Text(
                currencyName[index],
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              subtitle: Row(
                children: [
                  Text(
                    '\$${price[index]}',
                    style: const TextStyle(fontSize: 15, color: Colors.black87),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    '${percentage[index]}%',
                    style: const TextStyle(fontSize: 16, color: Colors.green),
                  )
                ],
              ),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: (){ },
            );
            
          },
          childCount: images.length,
          ),       
        ),
      ],
    );
  }
}

class SellTab extends StatefulWidget {
  const SellTab({Key? key}) : super(key: key);

  @override
  _SellTabState createState() => _SellTabState();
}

class _SellTabState extends State<SellTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Icon(
              Icons.shopping_cart,
              color: secondaryColor,
              size: 35,
            ),
          ),
          const Padding(
             padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10),
            child: Text('Sell Crypto', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),) ,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5),
            child: Text('Verify your identity to sell crypto for cash', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400,color: Colors.grey),) ,
          ),
          const Divider(thickness: 0.5,),
          const SizedBox(height: 20),
          const ListTile(
            leading: Text('1', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: popBlue),),
            title: Text('Verify Your Identity', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.black87),),
            subtitle: Text('To prevent identity theft or fraud, we\'ll need a make sure it\'s really you by uploading an ID.',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.grey),),
          ),
          const SizedBox(height: 10),
          const ListTile(
            leading: Text('2', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: popBlue),),
            title: Text('Buy Crypto', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.black87),),
            subtitle: Text('Use your Bank Debit or Credit card to fund any crypto buy.',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.grey),),
    
          ),
          const SizedBox(height: 10),
          const ListTile(
            leading: Text('3', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: popBlue),),
            title: Text('Sell at Anytime', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.black87),),
            subtitle: Text('Instantly sell your crypto for cash. Keep the cash in your wallet or withdraw to a linked bank.',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.grey),),
    
          ),
          const SizedBox(height: 30,),
          Center(child: buildButton(context, 'Verify My Identity'))
        ],
      ),
    );
  }
}
