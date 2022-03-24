import 'package:blockchain/pages/add_fab.dart';
import 'package:blockchain/pages/auth_screen.dart';
import 'package:blockchain/pages/home_page.dart';
import 'package:blockchain/pages/prices_page.dart';
import 'package:blockchain/widgets/circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blockchain.com',
      home:  HomePage(),
    );
  }
}

