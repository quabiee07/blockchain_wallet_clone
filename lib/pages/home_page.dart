import 'package:blockchain/constants.dart';
import 'package:blockchain/widgets/button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  List<IconData> data = [
    Icons.home_rounded,
    Icons.bar_chart_rounded,
    Icons.add_circle_outline_rounded,
    Icons.shopping_cart_outlined,
    Icons.timelapse_rounded
  ];

  List<String> text = ['Home', 'Prices', ' ', 'Buy & Sell', 'Activity'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                children: [
                  const Text(
                    "Home",
                    style: TextStyle(
                      fontSize: 24, 
                      fontWeight: FontWeight.bold),
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
            ),
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
            buildButton(context),
            const SizedBox(height: 10),
            buildTextButton(context)
          ],
        ),
      ),
      bottomNavigationBar: buildNavBar(context),
    );
  }

  Material buildNavBar(BuildContext context) {
    return Material(
      elevation: 10,
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            border:
                Border(top: BorderSide(width: 1.0, color: Colors.grey[300]!))),
        height: 70,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                width: 35,
                decoration: BoxDecoration(
                  border: index == selectedIndex
                      ? const Border(
                          top: BorderSide(width: 2.0, color: secondaryColor))
                      : null,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                        Icon(
                      data[index],
                      size: 25,
                      color: index == selectedIndex
                          ? secondaryColor
                          : Colors.grey[400],
                    ),

                     ],
                     ),

                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 0),
                       child: Text(
                        text[index],
                        style: TextStyle(
                          fontSize: 10,
                          color: index == selectedIndex
                          ? secondaryColor
                          : Colors.grey[400],
                        ),
                    ),
                     )
                  ],
                ),
              ),
            ),
          ),
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
