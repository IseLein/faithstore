import 'package:flutter/material.dart';
import 'package:faithstore/pages/login_page.dart';
import 'package:faithstore/pages/home.dart';
import 'package:faithstore/pages/sales.dart';
import 'package:faithstore/pages/orders.dart';
import 'package:faithstore/pages/stock.dart';
import 'package:faithstore/pages/settings.dart';
import 'package:faithstore/pages/main_nav.dart';

void main() {
  runApp(const FaithstoreApp());
}

class FaithstoreApp extends StatelessWidget {
  const FaithstoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        indicatorColor: Colors.black38,
        scaffoldBackgroundColor: Colors.white54,
        dividerColor: Colors.black,
        secondaryHeaderColor: const Color.fromRGBO(255, 155, 66, 1.0),
      ),
      home: const Login(),
      routes: {
        '/login': (context) => const Login(),
        '/home': (context) => const HomePage(),
        '/sales': (context) => const SalesPage(),
        '/orders': (context) => const OrdersPage(),
        '/stock': (context) => const StockPage(),
        '/settings': (context) => const SettingsPage(),
      },
    );
  }
}