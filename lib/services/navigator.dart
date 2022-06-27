import 'package:flutter/material.dart';
import 'package:faithstore/pages/main_nav.dart';


class AppNavigator {
  static void navigate(int index, BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MainNav(currIndex: index),
      ),
    );
  }

  static void goToCheckout(BuildContext context) {
    goToHome(context);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const MainNav(currIndex: 2),
      ),
    );
  }

  static void goToHome(BuildContext context) {
    Navigator.pop(context);
    Navigator.pop(context);
  }
}