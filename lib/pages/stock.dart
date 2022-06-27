import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StockPage extends StatefulWidget {
  const StockPage({Key? key}) : super(key: key);

  @override
  State<StockPage> createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Theme.of(context).dividerColor,
          leading: const Icon(FontAwesomeIcons.store),
          title: const Text("Stocks"),
          bottom: const TabBar(
            tabs: [
              Tab(child: Text("PH Books")),
              Tab(child: Text("Others"),)
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              children: const [
                SizedBox(height: 140.0),
                Text(
                  "Dev In Progress",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Column(
              children: const [
                SizedBox(height: 140.0),
                Text(
                  "Dev In Progress",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
