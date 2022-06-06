import 'package:flutter/material.dart';
import 'package:faithstore/services/book.dart';
import 'package:faithstore/pages/sale_info.dart';

class Sale {
  Book book;
  DateTime saleTime;
  int quantity;
  String trader;

  Sale({
    required this.book,
    required this.saleTime,
    required this.quantity,
    required this.trader,
  });

  Widget renderSaleWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SaleInfo(sale: this),
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

Book book1 = bookList[0];
Book book2 = bookList[1];
Book book3 = bookList2[0];
Book book4 = bookList2[0];

List<Sale> salesList = [
  Sale(book: book1, saleTime: DateTime(2022), quantity: 4, trader: 'Faith'),
  Sale(book: book1, saleTime: DateTime(2022), quantity: 4, trader: 'Faith'),
  Sale(book: book1, saleTime: DateTime(2022), quantity: 4, trader: 'Faith'),
  Sale(book: book2, saleTime: DateTime(2021), quantity: 4, trader: 'Faith'),
  Sale(book: book1, saleTime: DateTime(2021), quantity: 3, trader: 'Faith'),
  Sale(book: book4, saleTime: DateTime(2021), quantity: 5, trader: 'Seyi'),
  Sale(book: book1, saleTime: DateTime(2020), quantity: 3, trader: 'Seyi'),
  Sale(book: book1, saleTime: DateTime(2019), quantity: 1, trader: 'Seyi'),
  Sale(book: book1, saleTime: DateTime(2018), quantity: 4, trader: 'Seyi'),
  Sale(book: book3, saleTime: DateTime(2018), quantity: 4, trader: 'Seyi'),
  Sale(book: book3, saleTime: DateTime(2018), quantity: 4, trader: 'Seyi'),
  Sale(book: book3, saleTime: DateTime(2018), quantity: 4, trader: 'MLR PH'),
  Sale(book: book3, saleTime: DateTime(2018), quantity: 4, trader: 'MLR PH'),
  Sale(book: book3, saleTime: DateTime(2018), quantity: 4, trader: 'Faith'),
  Sale(book: book3, saleTime: DateTime(2018), quantity: 4, trader: 'Faith'),
  Sale(book: book3, saleTime: DateTime(2018), quantity: 4, trader: 'Faith'),
  Sale(book: book3, saleTime: DateTime(2018), quantity: 4, trader: 'Faith'),
  Sale(book: book3, saleTime: DateTime(2018), quantity: 4, trader: 'Faith'),
  Sale(book: book3, saleTime: DateTime(2018), quantity: 4, trader: 'MLR PH'),
  Sale(book: book3, saleTime: DateTime(2018), quantity: 4, trader: 'MLR PH'),
  Sale(book: book3, saleTime: DateTime(2018), quantity: 4, trader: 'MLR PH'),
  Sale(book: book3, saleTime: DateTime(2018), quantity: 4, trader: 'MLR PH'),
  Sale(book: book3, saleTime: DateTime(2018), quantity: 4, trader: 'MLR PH'),
  Sale(book: book3, saleTime: DateTime(2018), quantity: 4, trader: 'MLR PH'),
  Sale(book: book3, saleTime: DateTime(2018), quantity: 4, trader: 'MLR PH'),
];