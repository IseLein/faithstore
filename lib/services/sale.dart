import 'package:flutter/material.dart';
import 'package:faithstore/services/book.dart';
import 'package:faithstore/services/search.dart';
import 'package:faithstore/pages/sale_info.dart';

class Sale {
  String id;
  String bookId;
  Book book;
  DateTime saleTime;
  int quantity;
  String trader;

  Sale({
    required this.id,
    required this.bookId,
    required this.saleTime,
    required this.quantity,
    required this.trader,
  }) : book = Search.getBook(bookId);

  Widget renderSaleWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SaleInfo(saleId: id),
            ),
          );
        },
        child: Card(
          elevation: 2.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
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
                        fontSize: 20.0,
                      ),
                    ),
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
          ),
        ),
      ),
    );
  }
}