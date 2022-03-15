// import 'package:blockchain/color.dart';
// import 'package:flutter/material.dart';

// class NumButton extends StatelessWidget {
//   final int? number;
//   final String text;
//   final double size;
//   final VoidCallback onTap;

//   const NumButton(
//       {Key? key,
//       required this.number,
//       required this.text,
//       required this.size,
//       required this.onTap})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: size,
//       width: size,
//       child: TextButton(
//         onPressed: () => onTap ,
//         child: Column(
//           children: [
//             Expanded(
//               child: Center(
//                 child: Text(
//                   number.toString(),
//                   style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 20,
//                       fontWeight: FontWeight.w600),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Text(
//                 text,
//                 style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 16,
//                     fontWeight: FontWeight.normal),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class NumPad extends StatelessWidget {
//   final TextEditingController controller;
//   final Function delete;
//   final Function onSubmit;
//   final double buttonSize;

//   const NumPad(
//       {Key? key,
//       required this.controller,
//       required this.delete,
//       required this.onSubmit,
//       this.buttonSize = 70})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     return Container(
//       padding: const EdgeInsets.all(20),
//       color: primaryDark,
//       child: Column(
//         children: [
//           SizedBox(
//             height: height * 0.1,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 NumButton(
//                     number: 1,
//                     text: ' ',
//                     size: buttonSize,
//                     onTap: controller),
//                 NumButton(
//                     number: 2,
//                     text: 'ABC',
//                     size: buttonSize,
//                     controller: controller),
//                 NumButton(
//                     number: 3,
//                     text: 'DEF',
//                     size: buttonSize,
//                     controller: controller),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: height * 0.10,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 NumButton(
//                     number: 4,
//                     text: 'GHI',
//                     size: buttonSize,
//                     controller: controller),
//                 NumButton(
//                     number: 5,
//                     text: 'JKL',
//                     size: buttonSize,
//                     controller: controller),
//                 NumButton(
//                     number: 6,
//                     text: 'MNO',
//                     size: buttonSize,
//                     controller: controller),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: height * 0.10,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 NumButton(
//                     number: 7,
//                     text: 'PQRS ',
//                     size: buttonSize,
//                     controller: controller),
//                 NumButton(
//                     number: 8,
//                     text: 'TUV',
//                     size: buttonSize,
//                     controller: controller),
//                 NumButton(
//                     number: 9,
//                     text: 'WXYZ',
//                     size: buttonSize,
//                     controller: controller),
//               ],
//             ),
//           ),
//           const SizedBox(height: 10),
//           SizedBox(
//             height: height * 0.10,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 const SizedBox(
//                   height: 70,
//                   width: 70,
//                 ),
//                 NumButton(
//                     number: 0,
//                     text: '',
//                     size: buttonSize,
//                     controller: controller),
//                 IconButton(
//                   onPressed: () {
//                     delete;
//                   },
//                   icon: Image.asset("assets/clear.png"),
//                   iconSize: 40,
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:blockchain/color.dart';
import 'package:flutter/material.dart';
import 'package:pinput/src/pinput.dart';

class NumPad extends StatelessWidget {
  final TextEditingController controller;

  NumPad({required this.controller});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final width = MediaQuery.of(context).size.width;
        final height = MediaQuery.of(context).size.height;
        const buttonSize = 70.0;
        return Center(
          child: Container(
            width: constraints.maxWidth,
            alignment: Alignment.center,
            child: Material(
              color: primaryDark,
              child:  Column(
          children: [
            SizedBox(
              height: height * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NumButton(
                      number: '1',
                      text: ' ',
                      size: buttonSize,
                      onTap:()=> controller.text),
                  NumButton(
                      number: '2',
                      text: 'ABC',
                      size: buttonSize,
                      onTap: () => controller.text),
                  NumButton(
                      number: '3',
                      text: 'DEF',
                      size: buttonSize,
                      onTap: () => controller.text),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NumButton(
                      number: '4',
                      text: 'GHI',
                      size: buttonSize,
                      onTap: () => controller.text),
                  NumButton(
                      number: '5',
                      text: 'JKL',
                      size: buttonSize,
                      onTap: () => controller.text),
                  NumButton(
                      number: '6',
                      text: 'MNO',
                      size: buttonSize,
                      onTap: () => controller.text),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NumButton(
                      number: '7',
                      text: 'PQRS ',
                      size: buttonSize,
                      onTap: () => controller.text),
                  NumButton(
                      number: '8',
                      text: 'TUV',
                      size: buttonSize,
                      onTap: () => controller.text),
                  NumButton(
                      number: '9',
                      text: 'WXYZ',
                      size: buttonSize,
                      onTap: () =>controller.text),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: height * 0.10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    height: 70,
                    width: 70,
                  ),
                  NumButton(
                      number: '0',
                      text: '',
                      size: buttonSize,
                      onTap: () => controller.text),
                  IconButton(
                    onPressed: () {
                      controller.delete();
                    },
                    icon: Image.asset("assets/clear.png"),
                    iconSize: 40,
                  )
                ],
              ),
            ),
          ],
      ),
              // child: Stack(
              //   fit: StackFi,
              //   children: [
              //     ...[1, 2, 3, 4, 5].map(
              //       (index) {
              //         final k = index < 4 ? index - 1 : 5 - index;
              //         final top = 40.0 - (k * 20);

              //         return Positioned(
              //             top: top,
              //             left: (index - 1) * (buttonSize + spacing),
              //             child: NumButton(
              //                 number: index,
              //                 text: '',
              //                 size: buttonSize,
              //                 onTap: () => controller.append('', 4)));
              //       },
              //     ),
              //     ...[6, 7, 8, 9].map(
              //       (index) {
              //         final k = [7, 8].contains(index) ? 1 : 0;
              //         final top = 110.0 - (k * 25);
              //         final left = (index - 5.5) * (buttonSize + spacing);

              //         return Positioned(
              //             top: top,
              //             left: left,
              //             child: NumButton(
              //                 number: index,
              //                 text: '',
              //                 size: buttonSize,
              //                 onTap: ()=> controller.append('0', 4)
              //               )
              //         );
              //       },
              //     ),
              //     Positioned(
              //       top: 160,
              //       left: 0,
              //       right: 0,
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           NumButton(
              //                 number: 0,
              //                 text: '',
              //                 size: buttonSize,
              //                 onTap: ()=> controller.append('0', 4)
              //               ,
              //           ),
              //           const SizedBox(width: 4),
              //           NumButton(
              //                 number: null,
              //                 text: '-',
              //                 size: buttonSize,
              //                 onTap: ()=> controller.delete()
              //           )
                            
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
            ),
          ),
        );
      },
    );
  }
}

class NumButton extends StatelessWidget {
  final String number;
  final String text;
  final double size;
  final VoidCallback onTap;

  const NumButton(
      {Key? key,
      required this.number,
      required this.text,
      required this.size,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: size,
        width: size,
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  number,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
