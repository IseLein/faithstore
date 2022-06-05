import 'package:flutter/material.dart';
import 'package:faithstore/widgets/main_drawer.dart';

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
        appBar: AppBar(
          title: const Text("Stocks"),
          bottom: const TabBar(
            tabs: [
              Tab(child: Text("PH Books")),
              Tab(child: Text("Others"),)
            ],
          ),
        ),
        drawer: MainDrawer(currentPage: 3),
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
