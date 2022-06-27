import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:faithstore/pages/home.dart';
import 'package:faithstore/pages/cart.dart';
import 'package:faithstore/pages/sales.dart';
import 'package:faithstore/pages/stock.dart';
import 'package:faithstore/pages/settings.dart';

class MainNav extends StatefulWidget {
  const MainNav({Key? key, required this.currIndex}) : super(key: key);

  final int currIndex;

  @override
  State<MainNav> createState() => _MainNavState();
}

class _MainNavState extends State<MainNav> {
  final List<List> _menuItems = [
    ["Home", FontAwesomeIcons.house],
    ["Sales", FontAwesomeIcons.print],
    ["Cart", FontAwesomeIcons.cartShopping],
    ["Stock", FontAwesomeIcons.arrowTrendUp],
    ["Settings", FontAwesomeIcons.user],
  ];

  final List _pages = [
    const HomePage(),
    const SalesPage(),
    const CartPage(),
    const StockPage(),
    const SettingsPage(),
  ];

  late int _selectedIndex;

  @override
  initState() {
    _selectedIndex = widget.currIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).dividerColor,
        unselectedItemColor: Theme.of(context).indicatorColor,
        showUnselectedLabels: true,
        items: _menuItems.map((pair) =>
            BottomNavigationBarItem(
              icon: Icon(pair[1]),
              label: pair[0],
            )
        ).toList(),
        onTap: (int index) {
          setState((){
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
