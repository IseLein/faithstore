import 'package:flutter/material.dart';
import 'package:faithstore/pages/book_info.dart';

enum BookCategory {peaceHouse, others}

class Book {
  String id;
  String title;
  String shortTitle;
  String author;
  double price;
  int quantityLeft;
  BookCategory category;
  String image;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.price,
    required this.category,
    required this.quantityLeft,
    required this.shortTitle,
    required this.image,
  });

  String getId(){
    return id;
  }

  /// Precondition: [quantity] > 0
  bool reduceQuantity(int quantity) {
    if (quantityLeft < quantity) {
      return false;
    } else {
      quantityLeft -= quantity;
      return true;
    }
  }

  /// Precondition: [quantity] > 0
  void increaseQuantity(int quantity) {
    quantityLeft += quantity;
  }

  Widget renderHomeBook(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookInfo(bookId: id),
            ),
          );
        },
        splashColor: Colors.grey,
        child: Card(
          elevation: 2.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Image.asset(
                    image,
                  ),
                ),
              ),
              // const Divider(
              //   thickness: 1,
              //   color: Colors.grey,
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 6.0, right: 6.0),
                child: SizedBox(
                  height: 40.0,
                  child: Text(
                    shortTitle,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 2.0),
              Padding(
                padding: const EdgeInsets.only(left: 6.0, right: 6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text('N'),
                    Text(
                      '$price',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 17.0,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}