import 'package:flutter/material.dart';
import 'package:faithstore/pages/home.dart';
import 'package:faithstore/pages/orders.dart';
import 'package:faithstore/pages/sales.dart';
import 'package:faithstore/pages/stock.dart';
import 'package:faithstore/pages/settings.dart';

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
}