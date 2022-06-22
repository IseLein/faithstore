import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:faithstore/widgets/sales_bottom.dart';
import 'package:faithstore/widgets/main_drawer.dart';
import 'package:faithstore/widgets/home_sales.dart';
import 'package:faithstore/services/data.dart';
import 'package:faithstore/services/sale.dart';

class SalesPage extends StatefulWidget {
  const SalesPage({Key? key, }) : super(key: key);

  @override
  State<SalesPage> createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  List<Sale> sales = [];

  @override
  initState() {
    sales = Data.getSales().reversed.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Sales"),
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.print),
            ),
          ],
        ),
        bottom: const PreferredSize(
          preferredSize: Size(56.0, 56.0),
          child: Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: SalesBottom(),
          ),
        ),
      ),
      drawer: MainDrawer(currentPage: 2),
      body: HomeSales(salesList: sales),
    );
  }
}