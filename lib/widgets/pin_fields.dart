import 'package:blockchain/constants.dart';
import 'package:blockchain/widgets/circle.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

Widget buildInput() {
  final TextEditingController controller = TextEditingController();
  final defaultPinTheme = PinTheme(
      width: 35,
      height: 35,
      
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
          border: Border.all(color: primaryDark),
          borderRadius: BorderRadius.circular(20))
        );

  final focusedPinTheme = defaultPinTheme.copyDecorationWith(
    border: Border.all(color: primaryDark),
    borderRadius: BorderRadius.circular(10),
  );

  final submittedPinTheme = defaultPinTheme.copyWith(
    decoration: defaultPinTheme.decoration
        ?.copyWith(color: const Color.fromRGBO(234, 239, 243, 1)),
  );

  return Pinput(
    controller: controller,
    defaultPinTheme: defaultPinTheme,
    focusedPinTheme: focusedPinTheme,
    submittedPinTheme: submittedPinTheme,
    validator: (s) => s == '7777' ? null : 'Pin is incorrect',
    onCompleted: (pin) => print(pin),
    showCursor: false,
    obscureText: true,
    obscuringWidget: CustomPaint(painter: Circle()),
    keyboardType: TextInputType.none,
  );
}
