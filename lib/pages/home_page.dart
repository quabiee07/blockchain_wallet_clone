import 'package:blockchain/widgets/button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
            ),
            ),
      
            const SizedBox(height: 20,),
      
            buildButton(context),

            const SizedBox(height: 10),
      
            buildTextButton(context)
          ],
        ),
      ),
    );
  }
}
