import 'package:flutter/material.dart';
import 'package:faithstore/services/sale.dart';
import 'package:faithstore/services/search.dart';

class SaleInfo extends StatefulWidget {
  const SaleInfo({Key? key, required this.saleId}) : super(key: key);

  final String saleId;

  @override
  State<SaleInfo> createState() => _SaleInfoState();
}

class _SaleInfoState extends State<SaleInfo> {
  late Sale sale;

  @override
  initState() {
    sale = Search.getSale(widget.saleId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: Theme.of(context).dividerColor,
        title: const Text("Sale"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Center(
              child: Card(
                child: Image.asset(
                  'assets/images/book_image.jpg',
                  height: 200.0,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            saleProperty('Book', sale.book.title),
            saleProperty('Author', sale.book.author),
            saleProperty('Quantity', sale.quantity.toString()),
            saleProperty(
              'Sale Time',
              '${getReadableTime(sale.saleTime)} | ${sale.saleTime.day}'
                  '/${sale.saleTime.month}/${sale.saleTime.year}',
            ),
            saleProperty('Sold By', sale.trader),
          ],
        ),
      ),
    );
  }

  Widget saleProperty(String property, String value) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$property:',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
          SizedBox(
            width: 240.0,
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                letterSpacing: 1.0,
              ),
            ),
          )
        ],
      ),
    );
  }
  
  String getReadableTime(DateTime time) {
    String hour;
    String minute;
    if (time.hour.toString().length == 1) {
      hour = '0${time.hour}';
    } else {
      hour = '${time.hour}';
    }
    if (time.minute.toString().length == 1) {
      minute = '0${time.minute}';
    } else {
      minute = '${time.minute}';
    }
    return '$hour:$minute';
  }
}
