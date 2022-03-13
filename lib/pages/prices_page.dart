import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PricePage extends StatelessWidget {
  PricePage({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {

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
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  const Text(
                    "Prices",
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 150,
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
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        label: Text('Search Coins'),
                        suffixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 1,
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: currencyName.length,
                itemBuilder: (context, index) {
                  final dynamic image = (images as List)[index];
                  return ListTile(
                    leading: Image.asset(image, scale: 2,),
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
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          '${percentage[index]} %',
                          style: const TextStyle(
                              fontSize: 16, color: Colors.green),
                        ),
                      ],
                    ),
                    trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                    onTap: () {},
                  );
                },
                separatorBuilder: (BuildContext context, int index) => const Divider(),
                scrollDirection: Axis.vertical,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
