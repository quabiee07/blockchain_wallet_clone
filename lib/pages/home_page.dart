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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[selectedIndex],
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, size: 30),
        backgroundColor: secondaryColor,
        onPressed: () => showModalBottomSheet(
            enableDrag: true,
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
        onChange: (val) {
          setState(() {
            selectedIndex = val;
          });
        },
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
        body: const HomeBalance()
//       Column(
//         children: [
//           const SizedBox(
//             height: 50,
//           ),
//           const Center(
//             child: Text(
//               "Welcome to \nBlockchain.com!",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   fontSize: 20,
//                   fontStyle: FontStyle.normal,
//                   fontWeight: FontWeight.w700),
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           const Center(
//             child: Text(
//               "All your crypto balances will show up \n here once you buy or receive.",
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           buildButton(context, 'Buy Crypto'),
//           const SizedBox(height: 10),
//           buildTextButton(context)
//         ],
//       ),
        );
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
    "assets/bitcoin-btc-logo.png",
    "assets/ethereum-eth-logo.png",
    "assets/dogecoin-doge-logo.png",
    "assets/bitcoin-cash-bch-logo.png",
  ];

  List<String> currency = [
    'Naira',
    'Dollars',
    'Euros',
    'Pounds',
  ];

  List<String> symbols = ['NGN', 'USD', 'EUR', 'GBP'];

  List<double> price = [0.00, 0.00, 0.00, 0.00];

  @override
  Widget build(BuildContext context) {
    final List<String> logo = [
      "assets/bitcoin-btc-logo.png",
      "assets/ethereum-eth-logo.png",
      "assets/dogecoin-doge-logo.png",
      "assets/bitcoin-cash-bch-logo.png",
      "assets/chainlink-link-logo.png",
      "assets/algorand-algo-logo.png",
    ];
    final List<String> cryptoName = [
      "Bitcoin",
      "Ether",
      "Dogecoin",
      "Bitcoin Cash",
      "ChainLink",
      "Algorand",
    ];
    final List<String> amountInDollars = [
      "7,890.90",
      "1,159.26",
      "2,304.21",
      "303.32",
      "6,845",
      "4,198",
    ];
    final List<String> cryptoSymbol = [
      " BTC",
      " ETH",
      " DOGE",
      " BCH",
      " LINK",
      " ALGO"
    ];
    final List<double> amountInCrypto = [
      0.19,
      0.36,
      0.72,
      0.94,
      447.46,
      3276.9588
    ];
    // final chart = '';
    final List<double> cryptoPrice = [
      38882.47,
      2556.35,
      0.11330,
      287.28,
      13.06,
      0.70,
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
    final List<String> hrChange = [
      "24hrs",
      "24hrs",
      "24hrs",
      "24hrs",
      "24hrs",
      "24hrs"
    ];
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Total Balance',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.grey.shade700),
              )),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
            child: Text(
              '\$12,982.91',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
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
          const SizedBox(height: 20),
          const Divider(height: 2),
          SizedBox(
            height: 100,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: ((context, index) {
                return CurrencyCardView(
                    icon: images[index],
                    currency: currency[index],
                    symbol: symbols[index],
                    price: price[index]);
              }),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: MediaQuery.of(context).size.height/2,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: cryptoName.length,
              itemBuilder: (context, index) {
                return CryptoCardView(
                    logo: logo[index],
                    cryptoName: cryptoName[index],
                    amountInDollars: amountInDollars[index],
                    amountInCrypto: amountInCrypto[index],
                    cryptoSymbol: cryptoSymbol[index],
                    hrChange: hrChange[index],
                    cryptoPrice: cryptoPrice[index],
                    percentage: percentage[index]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(height: 1.9,);
              },
            ),
          )
        ],
      ),
    );
  }
}
