import 'package:blockchain/color.dart';
import 'package:flutter/material.dart';


class AddFabPage extends StatelessWidget {
  AddFabPage({Key? key}) : super(key: key);

  final title = ['Swap', 'Send', 'Receive', 'Rewards'];

  final subtitle = [
    'Exchange for Another Crypto',
    'Send to Any Wallet',
    'Copy Your Addresses & QR Codes',
    'Earn Rewards on Your Crypto'
  ];

  final icons =[
    'assets/swap.png',
    'assets/send.png',
    'assets/receive.png',
    'assets/rewards.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20,),
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final dynamic icon = (icons as List)[index];
                return ListTile(
                  leading: Image.asset(icon),
                  title: Text(title[index],
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold
                      )),
                  subtitle: Text(
                    subtitle[index],
                    style: const TextStyle(color: Colors.black87,fontWeight: FontWeight.w600),
                  ),
                  trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: title.length),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildBtn(context, 'Sell', btnDark),
              buildBtn(context, 'Buy', popBlue)

            ]
          ),
        )
      ],
    );
  }
}

Widget buildBtn(context, title, color){
  final width = MediaQuery.of(context).size.width/2.3;
  final ButtonStyle style = TextButton.styleFrom(
    backgroundColor: color,
      minimumSize: Size(width, 50),
      padding: const EdgeInsets.symmetric(horizontal: 10.0)
  );
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ElevatedButton(
          style: style,
          onPressed: () {},
          child:  Text(
            title,
          )),

    ],
  );
}

