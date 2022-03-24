import 'package:blockchain/color.dart';
import 'package:blockchain/pages/activity_page.dart';
import 'package:blockchain/pages/add_fab.dart';
import 'package:blockchain/pages/buy_sell_page.dart';
import 'package:blockchain/pages/prices_page.dart';
import 'package:blockchain/widgets/button.dart';
import 'package:blockchain/widgets/nav_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  List<Widget> body = [
    const Home(),
    PricePage(),
    const BuyNSell(),
    const ActivityPage()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[selectedIndex],
      floatingActionButton: FloatingActionButton(

        child: const Icon(Icons.add,size: 30),
        backgroundColor: secondaryColor,
        onPressed: () => showModalBottomSheet(
            enableDrag: true,
            context: context,
            builder: (context) {
              return AddFabPage();
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar:
        // BottomNavigationBar(items: items)
      CustomBottomNavigationBar(
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

  // Material buildNavBar(BuildContext context) {
  //   return Material(
  //     elevation: 10,
  //     color: Colors.white,
  //     child: Container(
  //       padding: const EdgeInsets.symmetric(horizontal: 10),
  //       decoration: BoxDecoration(
  //           border:
  //           Border(top: BorderSide(width: 1.0, color: Colors.grey[300]!))),
  //       height: 60,
  //       width: MediaQuery.of(context).size.width / data.length,
  //       child: ListView.builder(
  //         itemCount: data.length,
  //         itemBuilder: (context, index) => Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 15),
  //           child: GestureDetector(
  //             onTap: () {
  //               setState(() {
  //                 selectedIndex = index;
  //               });
  //             },
  //             child: AnimatedContainer(
  //               duration: const Duration(milliseconds: 300),
  //               width: 35,
  //               decoration: BoxDecoration(
  //                 border: index == selectedIndex
  //                     ? const Border(
  //                     top: BorderSide(width: 2.5, color: secondaryColor))
  //                     : null),
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                 children: [
  //                   Row(
  //                     mainAxisSize: MainAxisSize.max,
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       Icon(
  //                         data[index],
  //                         size: 25,
  //                         color: index == selectedIndex
  //                             ? secondaryColor
  //                             : Colors.grey[400]),
  //                     ],
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsets.symmetric(horizontal: 0),
  //                     child: Text(
  //                       text[index],
  //                       style: TextStyle(
  //                         fontSize: 10,
  //                         color: index == selectedIndex
  //                             ? secondaryColor
  //                             : Colors.grey[400]),
  //                     ),
  //                   )
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ),
  //         scrollDirection: Axis.horizontal,
  //       ),
  //     ),
  //   );
  // }


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
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
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
        ],),
      body: Column(
        children: [

          const SizedBox(
            height: 50,
          ),
          const Center(
            child: Text(
              "Welcome to \nBlockchain.com!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: Text(
              "All your crypto balances will show up \n here once you buy or receive.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildButton(context,'Buy Crypto'),
          const SizedBox(height: 10),
          buildTextButton(context)
        ],
      ),
    );
  }


}



