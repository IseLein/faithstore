import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:faithstore/services/book.dart';
import 'package:faithstore/services/sale.dart';

class CartItem {
  Book book;
  int quantity;
  String trader;

  CartItem({required this.book, required this.quantity, required this.trader});

  Sale toSale() {
    return Sale(
      book: book,
      saleTime: DateTime.now(),
      quantity: quantity,
      trader: trader,
    );
  }

  Widget renderCartItemWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {},
        child: Card(
          elevation: 2.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          book.shortTitle,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            letterSpacing: 1.0,
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          'N${book.price}',
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            letterSpacing: 1.0,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        )
                      ],
                    ),
                    Center(
                      child: Text(
                        '$quantity',
                        style: const TextStyle(
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.bold,
                          fontSize: 28.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(208, 208, 208, 1.0)
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: const [
                          Icon(FontAwesomeIcons.trashCan),
                          Text('DELETE'),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(208, 208, 208, 1.0)
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: const [
                          Icon(FontAwesomeIcons.penToSquare),
                          Text('EDIT'),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(208, 208, 208, 1.0)
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: const [
                          Icon(FontAwesomeIcons.checkDouble),
                          Text('SELL'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}