import 'package:flutter/material.dart';
import 'package:faithstore/widgets/sales_bottom.dart';
import 'package:faithstore/widgets/main_drawer.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders"),
        bottom: const PreferredSize(
          preferredSize: Size(56.0, 56.0),
          child: Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: SalesBottom(),
          ),
        ),
      ),
      drawer: MainDrawer(currentPage: 1),
      body: ListView(
        children: const [
          SizedBox(height: 140.0),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'No Online Orders Yet...',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      )
    );
  }
}