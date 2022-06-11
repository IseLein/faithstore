import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:faithstore/widgets/home_books.dart';
import 'package:faithstore/widgets/main_drawer.dart';
import 'package:faithstore/services/book.dart';
import 'package:faithstore/services/data.dart';
import 'package:faithstore/pages/cart.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    if (Data.phBookList.isEmpty) {
      Data.initData();
    }
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const TextField(
            showCursor: true,
            decoration: InputDecoration(
              prefix: Icon(FontAwesomeIcons.searchengin),
              isDense: true,
              constraints: BoxConstraints(minHeight: 0.0, maxHeight: 40.0),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(),
              hintText: 'Search Books',
            ),
          ),
          bottom: const TabBar(
              tabs: [
                Tab(child: Text("PH Books")),
                Tab(child: Text("Other")),
              ],
          ),
        ),
        drawer: MainDrawer(currentPage: 0),
        body: TabBarView(
          children:  [
            ListView(
              children: [
                HomeBooks(
                  bookCategory: BookCategory.peaceHouse,
                  thisBookList: Data.getBooks(BookCategory.peaceHouse),
                ),
              ],
            ),
            ListView(
              children: [
                HomeBooks(
                  bookCategory: BookCategory.others,
                  thisBookList: Data.getBooks(BookCategory.others),
                ),
              ],
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromRGBO(140, 140, 140, 1.0),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CartPage(),
              ),
            );
          },
          icon: const Icon(FontAwesomeIcons.cartShopping),
          label: const Text('Cart'),
        ),
      ),
    );
  }
}
