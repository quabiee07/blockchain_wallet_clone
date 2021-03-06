import 'package:blockchain/color.dart';
import 'package:flutter/material.dart';

Widget buildButton(BuildContext context, title) {
  final width = MediaQuery.of(context).size.width/1.129;
  final ButtonStyle style = ElevatedButton.styleFrom(
     padding: const EdgeInsets.symmetric(horizontal: 20.0),
      primary: secondaryColor, minimumSize:  Size(width, 50));
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: ElevatedButton(
        style: style,
        onPressed: () {},
        child:  Text(title,
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400))),
  );
}

Widget buildTextButton(BuildContext context) {
  // final ButtonStyle style = TextButton.styleFrom(
  //     primary: Colors.white, minimumSize: const Size(233.5, 50));
  final width = MediaQuery.of(context).size.width/4;
  final ButtonStyle style = TextButton.styleFrom(
    minimumSize: Size(100, 50),
    side: BorderSide(width: 1, color:  Colors.grey[300]!,),
    
    padding: const EdgeInsets.symmetric(horizontal: 10.0)
    
  );
    // padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 10)),
    // minimumSize: MaterialStateProperty.all( Size(width , 50)),
    //   side: MaterialStateProperty.all(
    //        BorderSide(width: 1, color: Colors.grey[300]!, )),
    //   foregroundColor: MaterialStateProperty.all(secondaryColor));
  return TextButton(
          style: style,
          onPressed: () {},
          child: const Text(
            'Send Max',
          ));
}
