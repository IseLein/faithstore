import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:faithstore/services/book.dart';

class BookInfo extends StatelessWidget {
  const BookInfo({Key? key, required this.book}) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book"),
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
            bookProperty('Title', book.title),
            bookProperty('Author', book.author),
            bookProperty('Category', '${book.category}'.substring(13)),
            bookProperty('Amount Left', '${book.quantityLeft}'),
            bookProperty('price', '${book.price}'),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                decoration: const InputDecoration(
                  label: Text('Quantity'),
                  hintText: 'Quantity',
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.only(left: 35.0, right: 35.0),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(FontAwesomeIcons.cartShopping),
                      SizedBox(width: 10.0),
                      Text('Add to Cart'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bookProperty(String property, String value) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$property:',
              style: const TextStyle(
                // fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              ),
            ),
            SizedBox(
              width: 230.0,
              child: Text(
                value,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  // fontSize: 20.0,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 1.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}