
// import 'package:blockchain/widgets/circle.dart';
// import 'package:flutter/material.dart';
// import 'package:pinput/pinput.dart';

// Widget buildInput(controller) {
//   final focusNode = FocusNode();
//   final defaultPinTheme = PinTheme(
//       width: 35,
//       height: 35,
//       textStyle: const TextStyle(
//           fontSize: 20,
//           fontWeight: FontWeight.w600),
//       decoration: BoxDecoration(
//           border: Border.all(color: primaryDark),
//           borderRadius: BorderRadius.circular(20))
//         );

//   final submittedPinTheme = defaultPinTheme.copyWith(
//     decoration: defaultPinTheme.decoration
//         ?.copyWith(color: const Color.fromRGBO(234, 239, 243, 1)),
//   );

//   return Pinput(
//     controller: controller, 
//     focusNode: focusNode,
//     pinAnimationType: PinAnimationType.scale,
//     length: 4,
//     defaultPinTheme: defaultPinTheme,
//     submittedPinTheme: submittedPinTheme,
//     validator: (s) => s == '7777' ? null : 'Pin is incorrect',
//     onCompleted: (pin) => print(pin),
//     showCursor: false,
//     obscureText: true,
//     obscuringWidget: CustomPaint(painter: Circle()),
//     keyboardType: TextInputType.none,
//   );
// }

import 'package:blockchain/widgets/circle.dart';
import 'package:flutter/material.dart';

import 'package:pinput/pinput.dart';

import '../color.dart';

class FilledRoundedPinPut extends StatefulWidget {
  @override
  _FilledRoundedPinPutState createState() => _FilledRoundedPinPutState();

  @override
  String toStringShort() => 'Rounded Filled';
}

class _FilledRoundedPinPutState extends State<FilledRoundedPinPut> {
  final controller = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  bool showError = false;

  @override
  Widget build(BuildContext context) {
    final length = 4;
    final defaultPinTheme = PinTheme(
      width: 35,
      height: 35,
      textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
          border: Border.all(color: primaryDark),
          borderRadius: BorderRadius.circular(20))
        );


    return SizedBox(
      height: 68,
      child: Pinput(
        length: length,
        controller: controller,
        focusNode: focusNode,
        defaultPinTheme: defaultPinTheme,
        keyboardType: TextInputType.none,
        onCompleted: (pin) {
          setState(() => showError = pin != '5555');
        },
        focusedPinTheme: defaultPinTheme,
        obscureText: true,
        showCursor: false,
        obscuringWidget: CustomPaint(painter: Circle(),),
      ),
    );
  }
}