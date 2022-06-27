import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:faithstore/widgets/home_books.dart';
import 'package:faithstore/services/book.dart';
import 'package:faithstore/services/data.dart';
import 'package:faithstore/services/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // These lists hold the books for display
  List<Book> _phBooks = [];
  List<Book> _otherBooks = [];

  @override
  initState() {
    // At the beginning all users are shown
    Data.initData();
    _phBooks = Data.getBooks(BookCategory.peaceHouse);
    _otherBooks = Data.getBooks(BookCategory.others);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            systemNavigationBarColor: Theme.of(context).primaryColor,
            statusBarColor: Theme.of(context).primaryColor,
          ),
          backgroundColor: Theme.of(context).primaryColor,
          title: ClipRRect(
            // borderRadius: BorderRadius.circular(25),
            child: TextField(
              onChanged: (value) => {
                setState(() {
                  _phBooks = Search.searchBooks(
                      value, Data.getBooks(BookCategory.peaceHouse)
                  );
                  _otherBooks = Search.searchBooks(
                      value, Data.getBooks(BookCategory.others)
                  );
                })
              },
              showCursor: true,
              textAlignVertical: TextAlignVertical.bottom,
              style: const TextStyle(
                fontSize: 18.0,
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: 16.0,
                  color: Theme.of(context).dividerColor,
                ),
                constraints: const BoxConstraints(minHeight: 0.0, maxHeight: 45.0),
                hintText: 'Search Books',
              ),
            ),
          ),
          bottom: const TabBar(
              tabs: [
                Tab(child: Text("PH Books")),
                Tab(child: Text("Other")),
              ],
          ),
        ),
        body: TabBarView(
          children:  [
            ListView(
              children: [
                HomeBooks(
                  bookCategory: BookCategory.peaceHouse,
                  thisBookList: _phBooks,
                ),
              ],
            ),
            ListView(
              children: [
                HomeBooks(
                  bookCategory: BookCategory.others,
                  thisBookList: _otherBooks,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
