import 'package:flutter/material.dart';
import 'package:faithstore/pages/book_info.dart';

enum BookCategory {peaceHouse, others}

class Book {
  String title;
  String shortTitle;
  String author;
  double price;
  int quantityLeft;
  BookCategory category;
  String image;

  Book({
    required this.title,
    required this.author,
    required this.price,
    required this.category,
    required this.quantityLeft,
    required this.shortTitle,
    required this.image,
  });

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
              builder: (context) => BookInfo(book: this),
            ),
          );
        },
        splashColor: Colors.grey,
        child: Card(
          elevation: 2.0,
          child: Column(
            children: [
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Image.asset(
                    image,
                  ),
                ),
              ),
              const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              SizedBox(
                height: 40.0,
                child: Center(
                  child: Text(
                    shortTitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 6.0),
              Text(
                author,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 3.0),
              Text(
                'N${price.toString()}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}