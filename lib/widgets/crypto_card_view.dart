import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../color.dart';

class CryptoCardView extends StatefulWidget {
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
  State<CryptoCardView> createState() => _CryptoCardViewState();
}

class _CryptoCardViewState extends State<CryptoCardView> {
  var formatter = NumberFormat('#,###,000');
  num cryptoAmount = 0;
  num dollarAmount = 0;
  num crypPrice = 0.0;
  late num cryAm;
  late num dolAm;
  late num cryPri;

  final _cryptoAmountController = TextEditingController();
  final _dollarAmountController = TextEditingController();
  final _cryptoPriceController = TextEditingController();

  void setAmount() {
    setState(() {
      cryptoAmount = cryAm;
      dollarAmount = dolAm;
      crypPrice = cryPri;

      _cryptoAmountController.clear();
      _dollarAmountController.clear();
      _cryptoPriceController.clear();
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: Container(
                  height: 350,
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _cryptoAmountController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text('crypto amount'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                        onChanged: ((value) => cryAm = int.parse(value)),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Text is empty';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _dollarAmountController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text('dollar amount'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                        onChanged: ((value) => dolAm = int.parse(value)),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Text is empty';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _cryptoPriceController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text('crypto price'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                        onChanged: ((value) => cryPri = int.parse(value)),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Text is empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: setAmount,
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(8),
                            fixedSize: MaterialStateProperty.all(
                                Size(MediaQuery.of(context).size.width, 50)),
                            backgroundColor:
                                MaterialStateProperty.all(secondaryColor),
                          ),
                          child: const Text('Submit')),
                    ],
                  ),
                ),
              );
            });
      },
      leading: Image.asset(widget.logo),
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          widget.cryptoName,
          style: const TextStyle(
              fontWeight: FontWeight.w600, fontSize: 17, color: Colors.black87),
        ),
      ),
      subtitle: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('\$${formatter.format(dollarAmount)}',
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.black87)),
            const SizedBox(
              height: 5,
            ),
            Text(cryptoAmount.toString() + widget.cryptoSymbol,
                style: TextStyle(
                    fontSize: 15,
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
                  child: widget.lineChart),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '\$${formatter.format(crypPrice)}',
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
                  text: widget.percentage.toString(),
                  style: TextStyle(
                      color: Colors.green.shade500,
                      fontWeight: FontWeight.w600),
                  children: [
                    TextSpan(
                      text: widget.hrChange,
                      style: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.w600),
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
