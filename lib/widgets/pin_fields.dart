
// // import 'package:blockchain/widgets/circle.dart';
// // import 'package:flutter/material.dart';
// // import 'package:pinput/pinput.dart';

// // Widget buildInput(controller) {
// //   final focusNode = FocusNode();
// //   final defaultPinTheme = PinTheme(
// //       width: 35,
// //       height: 35,
// //       textStyle: const TextStyle(
// //           fontSize: 20,
// //           fontWeight: FontWeight.w600),
// //       decoration: BoxDecoration(
// //           border: Border.all(color: primaryDark),
// //           borderRadius: BorderRadius.circular(20))
// //         );

// //   final submittedPinTheme = defaultPinTheme.copyWith(
// //     decoration: defaultPinTheme.decoration
// //         ?.copyWith(color: const Color.fromRGBO(234, 239, 243, 1)),
// //   );

// //   return Pinput(
// //     controller: controller, 
// //     focusNode: focusNode,
// //     pinAnimationType: PinAnimationType.scale,
// //     length: 4,
// //     defaultPinTheme: defaultPinTheme,
// //     submittedPinTheme: submittedPinTheme,
// //     validator: (s) => s == '7777' ? null : 'Pin is incorrect',
// //     onCompleted: (pin) => print(pin),
// //     showCursor: false,
// //     obscureText: true,
// //     obscuringWidget: CustomPaint(painter: Circle()),
// //     keyboardType: TextInputType.none,
// //   );
// // }

// import 'package:blockchain/widgets/circle.dart';
// import 'package:flutter/material.dart';

// import 'package:pinput/pinput.dart';

// import '../color.dart';

// class FilledRoundedPinPut extends StatefulWidget {

//   const FilledRoundedPinPut({Key? key,}) : super(key: key);
//   @override
//   _FilledRoundedPinPutState createState() => _FilledRoundedPinPutState();


// }

// class _FilledRoundedPinPutState extends State<FilledRoundedPinPut> {
//   late final controller;
//   late final focusNode;

//   @override
//   void initState() {
//     super.initState();
//     controller = TextEditingController();
//     focusNode = FocusNode();
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     focusNode.dispose();
//     super.dispose();
//   }

//   bool showError = false;

//   @override
//   Widget build(BuildContext context) {
//     const length = 4;
//     final defaultPinTheme = PinTheme(
//       width: 35,
//       height: 35,
//       textStyle: const TextStyle(
//           fontSize: 20,
//           fontWeight: FontWeight.w600),
//       decoration: BoxDecoration(
//           border: Border.all(color: primaryDark),
//           borderRadius: BorderRadius.circular(20))
//         );


//     return SizedBox(
//       height: 68,
//       child: Pinput(
//         length: length,
//         controller: controller,
//         focusNode: focusNode,
//         autofocus: true,
//         defaultPinTheme: defaultPinTheme,
//         keyboardType: TextInputType.none,
//         onCompleted: (pin) {
//           setState(() => showError = pin != controller.text);
//         },
//         focusedPinTheme: defaultPinTheme,
//         obscureText: true,
//         showCursor: false,
//         obscuringWidget: CustomPaint(painter: Circle(),),
//       ),
//     );
//   }
// }