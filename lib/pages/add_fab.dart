import 'package:blockchain/color.dart';
import 'package:blockchain/pages/buy_sell_page.dart';
import 'package:blockchain/widgets/button.dart';
import 'package:flutter/material.dart';

class AddFabPage extends StatelessWidget {
  AddFabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ListTile(
                leading: Image.asset(
                  'assets/swap.png',
                ),
                title: const Text('Swap',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold)),
                subtitle: const Text(
                  'Exchange for Another Crypto',
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                ),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              ),
              const Divider(
                thickness: 0.8,
              ),
              ListTile(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      enableDrag: true,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20))),
                      builder: (ctx) => const SendScreen());
                },
                leading: Image.asset(
                  'assets/send.png',
                ),
                title: const Text('Send',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold)),
                subtitle: const Text(
                  'Send to Any Wallet',
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                ),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              ),
              const Divider(
                thickness: 0.8,
              ),
              ListTile(
                leading: Image.asset(
                  'assets/receive.png',
                ),
                title: const Text('Receive',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold)),
                subtitle: const Text(
                  'Copy Your Addresses & QR Codes',
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                ),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              ),
              const Divider(
                thickness: 0.8,
              ),
              ListTile(
                leading: Image.asset('assets/rewards.png'),
                title: const Text('Rewards',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold)),
                subtitle: const Text(
                  'Earn Rewards on Your Crypto',
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                ),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildBtn(
                      context,
                      'Sell',
                      btnDark),
                  buildBtn(
                      context,
                      'Buy',
                      popBlue)
                ]),
          ),
        ],
      ),
    );
  }
}

Widget buildBtn(context, title, color, ) {
  final width = MediaQuery.of(context).size.width / 2.3;
  final ButtonStyle style = TextButton.styleFrom(
      backgroundColor: color,
      minimumSize: Size(width, 50),
      padding: const EdgeInsets.symmetric(horizontal: 10.0));
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ElevatedButton(
          style: style,
          onPressed: (){},
          child: Text(
            title,
          )),
    ],
  );
}

class SendScreen extends StatefulWidget {
  const SendScreen({Key? key}) : super(key: key);

  @override
  State<SendScreen> createState() => _SendScreenState();
}

class _SendScreenState extends State<SendScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.89,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Send Bitcoin',
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            title: const Text(
              'My BTC Wallet',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: const Text(
              'To: 0xC91MSn4RtxeDz1Fd...',
              style: TextStyle(
                fontSize: 18,
                overflow: TextOverflow.ellipsis,
                color: Colors.grey,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  "assets/bitcoin-btc-logo.png",
                  scale: 5,
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 254, 229, 192),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_upward,
                      color: Colors.deepOrange,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(
            thickness: 0.8,
          ),
          Container(
            decoration: const BoxDecoration(),
            child: Column(
              children: [
                TextFormField(
                  textAlign: TextAlign.center,
                  cursorColor: Colors.grey,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 60,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        cursorColor: Colors.grey,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Column(
                        children: const [
                          Icon(
                            Icons.keyboard_arrow_up_rounded,
                            color: primaryColor,
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Available',
                      style: TextStyle(
                        fontSize: 18,
                        overflow: TextOverflow.ellipsis,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '\$4,675.54',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: buildTextButton(context),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          buildButton(context, 'Next')
        ],
      ),
    );
  }
}
