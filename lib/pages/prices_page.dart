import 'package:flutter/material.dart';

import 'settings_page.dart';

class PricePage extends StatefulWidget {
  const PricePage({Key? key}) : super(key: key);

  @override
  State<PricePage> createState() => _PricePageState();
}

class _PricePageState extends State<PricePage> {
  //This list holds data for the list view
  List<String> foundCrypto = [];
  late List<Widget> priceCryptoData;

  @override
  void initState() {
    // TODO: implement initState
    //at start, all crypto currency are shown
    // foundCrypto = currencyName;
    super.initState();
    priceCryptoData = getPriceCrypto();
  }


  //this func is called whenever the textField changes
  // void runFilter(String keyword){
  //   List<String> results =[];
  //   if(keyword.isEmpty){
  //     //if search field is empty or contains white-spaces, display all crypto currency
  //     results = currencyName;
  //   } else {
  //     results = currencyName.where((element) =>
  //         element[currencyName as int].toLowerCase().contains(keyword.toLowerCase())).toList();
  //   }
  //
  //   setState(() {
  //     foundCrypto = results;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Prices",
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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SettingsPage()));
              },
              icon: const Icon(
                Icons.person_rounded,
                color: Colors.grey,
                size: 30,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 500,
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: priceCryptoData.length,
                itemBuilder: (context, index) {
                  return priceCryptoData[index];
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                scrollDirection: Axis.vertical,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<PriceCryptoCard> getPriceCrypto() {
  final List<PriceCryptoCard> priceCryptoData = [
    const PriceCryptoCard(
      image: "assets/bitcoin-btc-logo.png",
      currencyName: "Bitcoin",
      price: "21,043.41",
      percentage: 0.06,
    ),
     const PriceCryptoCard(
      image: "assets/ethereum-eth-logo.png",
      currencyName:  "Ether",
      price: "1,165.99",
      percentage: 0.45,
    ),
    const PriceCryptoCard(
      image: "assets/dogecoin-doge-logo.png",
      currencyName:   "Dogecoin",
      price: "0.06619",
      percentage: 0.28,
    ),
     const PriceCryptoCard(
      image: "assets/bitcoin-cash-bch-logo.png",
      currencyName:   "Bitcoin Cash",
      price: "118.87",
      percentage: 0.84,
    ),
    const PriceCryptoCard(
      image: "assets/chainlink-link-logo.png",
      currencyName: "ChainLink",
      price: "7.16",
      percentage: 3.59,
    ),
     const PriceCryptoCard(
      image: "assets/algorand-algo-logo.png",
      currencyName: "Algorand",
      price: "0.349",
      percentage: 1.32,
    ),
    const PriceCryptoCard(
      image: "assets/cardano-ada-logo.png",
      currencyName:  "Cardano",
      price: "0.501",
      percentage: 4.99,
    ),
    const PriceCryptoCard(
      image: "assets/xrp-xrp-logo.png",
      currencyName: "Xrp",
      price: "0.3631",
      percentage: 0.45,
    ),
    const PriceCryptoCard(
      image: "assets/solana-sol-logo.png",
      currencyName:  "Solana",
      price: "41.05",
      percentage:8.69 ,
    ),
    const PriceCryptoCard(
      image: "assets/litecoin-ltc-logo.png",
      currencyName: "Litecoin",
      price: "55.52",
      percentage: 0.43,
    ),
    const PriceCryptoCard(
      image:  "assets/tether-usdt-logo.png",
      currencyName: "Tether",
      price: "0.99",
      percentage: 0.01,
    ),
  ];
  return priceCryptoData;
}


class PriceCryptoCard extends StatelessWidget {
  const PriceCryptoCard({
    Key? key,
    required this.image,
    required this.currencyName,
    required this.price,
    required this.percentage,
  }) : super(key: key);

  final String image;
  final String currencyName;
  final String price;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        image,
        scale: 1,
      ),
      title: Text(
        currencyName,
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
      ),
      subtitle: Row(
        children: [
          Text(
            '\$$price',
            style: const TextStyle(fontSize: 15, color: Colors.black87),
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            '$percentage%',
            style: const TextStyle(fontSize: 16, color: Colors.green),
          ),
        ],
      ),
      trailing: const Icon(Icons.keyboard_arrow_right_rounded),
      onTap: () {},
    );
  }
}
