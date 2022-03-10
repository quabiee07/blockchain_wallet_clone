import 'package:blockchain/constants.dart';
import 'package:flutter/material.dart';

Widget buildButton(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  final ButtonStyle style = ElevatedButton.styleFrom(
      primary: secondaryColor, minimumSize:  Size(width, 50));
  return ElevatedButton(
      style: style,
      onPressed: () {},
      child: const Text('Buy Crypto',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400)));
}

Widget buildTextButton(BuildContext context) {
  // final ButtonStyle style = TextButton.styleFrom(
  //     primary: Colors.white, minimumSize: const Size(233.5, 50));
  final width = MediaQuery.of(context).size.width;
  final ButtonStyle style = ButtonStyle(
    minimumSize: MaterialStateProperty.all( Size(width /2, 50)),
      side: MaterialStateProperty.all(
        
           BorderSide(width: 1, color: Colors.grey[300]!, )),
      foregroundColor: MaterialStateProperty.all(secondaryColor),
      padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 10, horizontal: 50)));
  return Row(
    children: [
      TextButton(
          style: style,
          onPressed: () {},
          child: const Text(
            'Receive',
          )),
      TextButton(
          style: style,
          onPressed: () {},
          child: const Text(
            'Deposit',
           
           
          ))
    ],
  );
}
