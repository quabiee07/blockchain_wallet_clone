import 'dart:async';
import 'dart:developer';
import 'dart:math';

import 'package:blockchain/color.dart';
import 'package:blockchain/pages/activity_page.dart';
import 'package:blockchain/pages/add_fab.dart';
import 'package:blockchain/pages/buy_sell_page.dart';
import 'package:blockchain/pages/prices_page.dart';
import 'package:blockchain/widgets/crypto_card_view.dart';
import 'package:blockchain/widgets/currency_card_view.dart';
import 'package:blockchain/widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  List<Widget> body = [
    const Home(),
    const PricePage(),
    const BuyNSell(),
    const ActivityPage()
  ];

  void onTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //wraped the screen with an indexed stack to keep the page alive when navigating
      body: IndexedStack(
        index: selectedIndex,
        children: body,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, size: 30),
        backgroundColor: secondaryColor,
        onPressed: () => showModalBottomSheet(
            enableDrag: true,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            context: context,
            builder: (context) {
              return AddFabPage();
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNavigationBar(
        iconList: const [
          Icons.home_rounded,
          Icons.bar_chart_rounded,
          Icons.shopping_cart_outlined,
          Icons.timelapse_rounded
        ],
        text: const ['Home', 'Prices', 'Buy & Sell', 'Activity'],
        onChange: onTapped,
        defaultSelectedIndex: 0,
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Home",
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
        body: const HomeBalance());
  }
}

class HomeBalance extends StatefulWidget {
  const HomeBalance({Key? key}) : super(key: key);

  @override
  State<HomeBalance> createState() => _HomeBalanceState();
}

class _HomeBalanceState extends State<HomeBalance> {
  List<Icon> currencyImage = [
    const Icon(Icons.money),
    const Icon(Icons.money),
    const Icon(Icons.money),
    const Icon(Icons.money),
  ];

  List<String> images = [
    "assets/dollar.png",
    "assets/pound.png",
    "assets/euro.png",
    "assets/yen.png",
  ];

  List<String> currency = ['Dollars', 'Pounds', 'Euros', 'Yen'];

  List<String> sym = ['\$', '£', '€', '¥'];

  List<String> symbols = ['USD', 'GBP', 'EUR', 'JPY'];

  List<double> price = [0.00, 0.00, 0.00, 0.00];

  int index = 0;
  double _balance = 12982.91;
  final _rand = Random();
  var counter = 0.0;

  late Stream<double?> balanceStream;
  late List<Widget> cryptoData;

  Stream<double?> getBalance() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 7));
      yield _balance += _rand.nextInt(200) + 29;
    }
  }

  @override
  void initState() {
    super.initState();
    cryptoData = getCryptoCard();
    balanceStream = getBalance();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Text(
                        'Total Balance',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.grey.shade700),
                      )),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                    child: StreamBuilder(
                      initialData: _balance,
                      stream: balanceStream,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Text('Wait');
                        } else if (snapshot.hasData) {
                          final balance = snapshot.data;
                          return Text(
                            '$balance',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        } else {
                          return Text('No Balance');
                        }
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          '+\$407.66 (3.14%)',
                          style: TextStyle(
                              color: Colors.green.shade500,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Text(
                        ' 24hrs',
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Center(),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(height: 2),
          SizedBox(
            height: 100,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: currency.length,
              itemBuilder: ((context, index) {
                return CurrencyCardView(
                  icon: images[index],
                  currency: currency[index],
                  symbol: symbols[index],
                  price: price[index],
                  sym: sym[index],
                );
              }),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: cryptoData.length,
              itemBuilder: (context, index) {
                return cryptoData[index];
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            ),
          )
        ],
      ),
    ]);
  }

  List<CryptoCardView> getCryptoCard() {
    final List<CryptoCardView> cryptoData = [
      const CryptoCardView(
        logo: "assets/bitcoin-btc-logo.png",
        cryptoName: "Bitcoin",
        amountInDollars: "7,890.90",
        amountInCrypto: 0.19,
        cryptoSymbol: " BTC",
        hrChange: '24hrs',
        cryptoPrice: '38,882.47',
        percentage: 0.06,
      ),
     const CryptoCardView(
        logo: "assets/ethereum-eth-logo.png",
        cryptoName: "Ether",
        amountInDollars: "1,159.26",
        amountInCrypto: 0.36,
        cryptoSymbol: " ETH",
        hrChange: '24hrs',
        cryptoPrice: '2,556.35',
        percentage: 0.45,
      ),
      const CryptoCardView(
        logo: "assets/dogecoin-doge-logo.png",
        cryptoName: "Dogecoin",
        amountInDollars: "2,304.21",
        amountInCrypto: 0.72,
        cryptoSymbol: " DOGE",
        hrChange: '24hrs',
        cryptoPrice: '0.11330',
        percentage: 0.28,
      ),
      const CryptoCardView(
        logo: "assets/bitcoin-cash-bch-logo.png",
        cryptoName: "Bitcoin Cash",
        amountInDollars: "303.32",
        amountInCrypto: 0.94,
        cryptoSymbol: " BCH",
        hrChange: '24hrs',
        cryptoPrice: '287.28',
        percentage: 0.82,
      ),
      const CryptoCardView(
        logo: "assets/chainlink-link-logo.png",
        cryptoName: "ChainLink",
        amountInDollars: "6,845",
        amountInCrypto: 447.46,
        cryptoSymbol: " LINK",
        hrChange: '24hrs',
        cryptoPrice: '13.06',
        percentage: 3.59,
      ),
      const CryptoCardView(
        logo: "assets/algorand-algo-logo.png",
        cryptoName: "Algorand",
        amountInDollars: "4,198",
        amountInCrypto: 3276.9588,
        cryptoSymbol: " ALGO",
        hrChange: '24hrs',
        cryptoPrice: '0.70',
        percentage: 0.98,
      ),
    ];
    return cryptoData;
  }
}

