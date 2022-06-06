import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:faithstore/services/sale.dart';

class SaleInfo extends StatelessWidget {
  const SaleInfo({Key? key, required this.sale}) : super(key: key);

  final Sale sale;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              'Sale Time:',
              '${getReadableTime(sale.saleTime)} ${sale.saleTime.day}'
                  '-${sale.saleTime.month}-${sale.saleTime.year}',
            ),
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
      hour = '0${time.hour.toString()}';
    } else {
      hour = time.toString();
    }
    if (time.minute.toString().length == 1) {
      minute = '0${time.minute.toString()}';
    } else {
      minute = time.toString();
    }
    return '$hour:$minute';
  }
}
