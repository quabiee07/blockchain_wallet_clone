import 'package:chart_sparkline/chart_sparkline.dart';
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
  const CryptoCardView(
      {Key? key,
      required this.logo,
      required this.cryptoName,
      required this.amountInDollars,
      required this.amountInCrypto,
      required this.cryptoSymbol,
      required this.hrChange,
      required this.cryptoPrice,
      required this.percentage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int index = 0;
    var data = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];
    var colors = [
      Colors.blue,
      Colors.purple,
      Colors.red,
      Colors.yellow,
      Colors.green,
      Colors.orange,
      Colors.tealAccent
    ];
    return ListTile(
      leading: Image.asset(logo),
      title: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(cryptoName,
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.black87)),
        ),
      ),
      subtitle: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('\$$amountInDollars',
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    color: Colors.black87)),
            Text(amountInCrypto.toString() + cryptoSymbol,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 17,
                    color: Colors.grey.shade500)),
          ],
        ),
      ),
      trailing: SizedBox(

        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SizedBox(
                width: 100,
                height: 300,
                child: Sparkline(
                  data: data,
                  lineWidth: 3.0,
                  lineColor: colors[index],
                ),
              ),
            ),
            
            SizedBox(height: 5,),
            Text(
              '\$$cryptoPrice',
              maxLines: 1,
              style: const TextStyle(
                  fontSize: 17,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 5,),

            Text(
              percentage.toString(),
              maxLines: 1,
              style: const TextStyle(fontSize: 16, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
