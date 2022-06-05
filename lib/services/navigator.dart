import 'package:flutter/material.dart';

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