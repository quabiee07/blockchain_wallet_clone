
import 'package:flutter/material.dart';

class CryptoCardView extends StatelessWidget {
  final String logo;
  final String cryptoName;
  final String amountInDollars;
  final String cryptoSymbol;
  final String hrChange;
  final double amountInCrypto;
  final String cryptoPrice;
  final double percentage;
  final Widget lineChart;
  const CryptoCardView({
    Key? key,
    required this.logo,
    required this.cryptoName,
    required this.amountInDollars,
    required this.amountInCrypto,
    required this.cryptoSymbol,
    required this.hrChange,
    required this.cryptoPrice,
    required this.percentage,
    required this.lineChart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(logo),
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          cryptoName,
          style: const TextStyle(
              fontWeight: FontWeight.w600, fontSize: 17, color: Colors.black87),
        ),
      ),
      subtitle: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('\$$amountInDollars',
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.black87)),
            const SizedBox(
              height: 5,
            ),
            Text(amountInCrypto.toString() + cryptoSymbol,
                style: TextStyle(
                  fontSize:15,
                    fontWeight: FontWeight.w500,                  
                    color: Colors.grey.shade500)),
          ],
        ),
      ),
      trailing: Container(
        width: 150,
        constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width / 2, maxHeight: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Container(
                  width: 100,
                  height: 300,
                  constraints: BoxConstraints(minHeight: 20, maxHeight: 35),
                  child: lineChart),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '\$$cryptoPrice',
              maxLines: 1,
              style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 5,
            ),
            RichText(
              text: TextSpan(
                  text: percentage.toString(),
                  style: TextStyle(
                      color: Colors.green.shade500,
                      fontWeight: FontWeight.w600),
                      children: [
                        TextSpan(text: hrChange, style: TextStyle(
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.w600),)
                      ]),
            ),
          ],
        ),
      ),
    );
  }
}
