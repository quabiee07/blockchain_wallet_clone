import 'package:flutter/material.dart';

class BuyNSell extends StatefulWidget {
  const BuyNSell({Key? key}) : super(key: key);

  @override
  State<BuyNSell> createState() => _BuyNSellState();
}

class _BuyNSellState extends State<BuyNSell> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:BuyPage()
    );
  }
}

class BuyPage extends StatefulWidget {
  const BuyPage({Key? key}) : super(key: key);

  @override
  _BuyPageState createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(children: [
      Padding(
          padding: const EdgeInsets.all(8),
          child: Expanded(
            child: Row(
              children: [
                const Text(
                  "Buy & Sell",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 158,
                ),
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
          ))
    ]));
  }
}
