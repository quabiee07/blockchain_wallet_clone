import 'package:flutter/material.dart';

class CurrencyCardView extends StatelessWidget {
  final icon;
  final currency;
  final symbol;
  final price;
  final sym;
  const CurrencyCardView({ 
    Key? key,
    required this.icon,
    required this.currency,
    required this.symbol,
    required this.price, this.sym
     }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Container(
      height: 80,
      width: 220,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(10.0)),
      child: ListTile(
        onTap:(){},
        leading:Image.asset(icon, scale: 3,),
        title: Text(
          currency.toString(),
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          symbol.toString(),
          style:
              const TextStyle(fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        trailing: SizedBox(//added to solve a trailing widget error with list tile
          width: 40,//added
          child: Text(            
            '$sym$price',
            maxLines: 1,//added
            overflow: TextOverflow.ellipsis,//added
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ),
    ),
  );
  }
}