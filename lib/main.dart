import 'package:flutter/material.dart';
import 'package:faithstore/pages/login_page.dart';
import 'package:faithstore/pages/home.dart';
import 'package:faithstore/pages/sales.dart';
import 'package:faithstore/pages/orders.dart';
import 'package:faithstore/pages/stock.dart';
import 'package:faithstore/pages/settings.dart';

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
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color.fromRGBO(140, 140, 140, 1.0),
          onPrimary: Color.fromRGBO(54, 54, 54, 1.0),
          primaryContainer: Color.fromRGBO(181, 181, 181, 1.0),
          onPrimaryContainer: Color.fromRGBO(54, 54, 54, 1.0),
          secondary: Color.fromRGBO(135, 125, 39, 1.0),
          onSecondary: Color.fromRGBO(0, 0, 0, 1.0),
          secondaryContainer: Color.fromRGBO(199, 185, 57, 1.0),
          onSecondaryContainer: Color.fromRGBO(0, 0, 0, 1.0),
          error: Color.fromARGB(255, 65, 11, 11),
          onError: Color.fromRGBO(140, 140, 140, 1.0),
          errorContainer: Color.fromARGB(255, 151, 90, 90),
          onErrorContainer: Color.fromRGBO(140, 140, 140, 1.0),
          background: Color.fromRGBO(255, 255, 255, 1.0),
          onBackground: Color.fromARGB(255, 53, 53, 53),
          outline: Color.fromRGBO(208, 208, 208, 1.0),
          surface: Color.fromRGBO(140, 140, 140, 1.0),
          onSurface: Color.fromRGBO(54, 54, 54, 1.0),
        ),
      ),
      home: const HomePage(),
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