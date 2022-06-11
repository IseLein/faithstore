import 'package:flutter/material.dart';
import 'package:faithstore/pages/cart.dart';

List pages = [
  '/home',
  '/orders',
  '/sales',
  '/stock',
  '/settings',
];

class AppNavigator {
  static void navigate(int index, BuildContext context) {
    Navigator.pushReplacementNamed(context, pages[index]);
  }

  static void goToCheckout(BuildContext context) {
    goToHome(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CartPage(),
      ),
    );
  }

  static void goToHome(BuildContext context) {
    Navigator.pop(context);
    Navigator.pop(context);
  }
}