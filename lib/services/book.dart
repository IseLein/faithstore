import 'package:flutter/material.dart';
import 'package:faithstore/pages/book_info.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum BookCategory {peaceHouse, others}

class Book {
  String title;
  String shortTitle;
  String author;
  double price;
  BookCategory category;

  Book({
    required this.title,
    required this.author,
    required this.price,
    required this.category,
    required this.shortTitle,
  });

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
                    'assets/images/book_image.jpg',
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

List<Book> bookList = [
  Book(
    title: "The Concept and Conditions of Discipleship",
    shortTitle: "Concepts of Discipleship",
    author: "Gbile Akanni",
    price: 700.00,
    category: BookCategory.peaceHouse,
  ),
  Book(
    title: "A Spiritual Woman",
    shortTitle: "A Spiritual Woman",
    author: "Sade Akanni",
    price: 500.00,
    category: BookCategory.peaceHouse,
  ),
  Book(
    title: "What God looks for in His Vessel",
    shortTitle: "Vessel",
    author: "Gbile Akanni",
    price: 500.00,
    category: BookCategory.peaceHouse
  ),
  Book(
    title: "The Concept and Conditions of Discipleship",
    shortTitle: "Concepts of Discipleship",
    author: "Gbile Akanni",
    price: 700.00,
    category: BookCategory.peaceHouse,
  ),
  Book(
    title: "A Spiritual Woman",
    shortTitle: "A Spiritual Woman",
    author: "Sade Akanni",
    price: 500.00,
    category: BookCategory.peaceHouse,
  ),
  Book(
      title: "What God looks for in His Vessel",
      shortTitle: "Vessel",
      author: "Gbile Akanni",
      price: 500.00,
      category: BookCategory.peaceHouse
  ),
  Book(
    title: "The Concept and Conditions of Discipleship",
    shortTitle: "Concepts of Discipleship",
    author: "Gbile Akanni",
    price: 700.00,
    category: BookCategory.peaceHouse,
  ),
  Book(
    title: "A Spiritual Woman",
    shortTitle: "A Spiritual Woman",
    author: "Sade Akanni",
    price: 500.00,
    category: BookCategory.peaceHouse,
  ),
  Book(
      title: "What God looks for in His Vessel",
      shortTitle: "Vessel",
      author: "Gbile Akanni",
      price: 500.00,
      category: BookCategory.peaceHouse
  ),
  Book(
    title: "The Concept and Conditions of Discipleship",
    shortTitle: "Concepts of Discipleship",
    author: "Gbile Akanni",
    price: 700.00,
    category: BookCategory.peaceHouse,
  ),
  Book(
    title: "A Spiritual Woman",
    shortTitle: "A Spiritual Woman",
    author: "Sade Akanni",
    price: 500.00,
    category: BookCategory.peaceHouse,
  ),
  Book(
      title: "What God looks for in His Vessel",
      shortTitle: "Vessel",
      author: "Gbile Akanni",
      price: 500.00,
      category: BookCategory.peaceHouse
  ),
  Book(
    title: "The Concept and Conditions of Discipleship",
    shortTitle: "Concepts of Discipleship",
    author: "Gbile Akanni",
    price: 700.00,
    category: BookCategory.peaceHouse,
  ),
  Book(
    title: "A Spiritual Woman",
    shortTitle: "A Spiritual Woman",
    author: "Sade Akanni",
    price: 500.00,
    category: BookCategory.peaceHouse,
  ),
  Book(
      title: "What God looks for in His Vessel",
      shortTitle: "Vessel",
      author: "Gbile Akanni",
      price: 500.00,
      category: BookCategory.peaceHouse
  ),
  Book(
    title: "The Concept and Conditions of Discipleship",
    shortTitle: "Concepts of Discipleship",
    author: "Gbile Akanni",
    price: 700.00,
    category: BookCategory.peaceHouse,
  ),
  Book(
    title: "A Spiritual Woman",
    shortTitle: "A Spiritual Woman",
    author: "Sade Akanni",
    price: 500.00,
    category: BookCategory.peaceHouse,
  ),
  Book(
      title: "What God looks for in His Vessel",
      shortTitle: "Vessel",
      author: "Gbile Akanni",
      price: 500.00,
      category: BookCategory.peaceHouse
  ),
  Book(
    title: "The Concept and Conditions of Discipleship",
    shortTitle: "Concepts of Discipleship",
    author: "Gbile Akanni",
    price: 700.00,
    category: BookCategory.peaceHouse,
  ),
  Book(
    title: "A Spiritual Woman",
    shortTitle: "A Spiritual Woman",
    author: "Sade Akanni",
    price: 500.00,
    category: BookCategory.peaceHouse,
  ),
  Book(
      title: "What God looks for in His Vessel",
      shortTitle: "Vessel",
      author: "Gbile Akanni",
      price: 500.00,
      category: BookCategory.peaceHouse
  ),
];

List<Book> bookList2 = [
  Book(
      title: "What is a Woman",
      author: "Matt Walsh",
      price: 3000,
      category: BookCategory.others,
      shortTitle: "What is a Woman",
  ),
  Book(
      title: "12 Rules for Life",
      author: "Jordan B. Peterson",
      price: 4000,
      category: BookCategory.others,
      shortTitle: "Woke Mind Virus",
  ),
  Book(
    title: "Colorade, My Home!",
    author: "Maye Musk",
    price: 3200,
    category: BookCategory.others,
    shortTitle: "Colorado, My Home",
  ),
  Book(
    title: "What is a Woman",
    author: "Matt Walsh",
    price: 3000,
    category: BookCategory.others,
    shortTitle: "What is a Woman",
  ),
  Book(
    title: "12 Rules for Life",
    author: "Jordan B. Peterson",
    price: 4000,
    category: BookCategory.others,
    shortTitle: "Woke Mind Virus",
  ),
  Book(
    title: "Colorade, My Home!",
    author: "Maye Musk",
    price: 3200,
    category: BookCategory.others,
    shortTitle: "Colorado, My Home",
  ),
  Book(
    title: "What is a Woman",
    author: "Matt Walsh",
    price: 3000,
    category: BookCategory.others,
    shortTitle: "What is a Woman",
  ),
  Book(
    title: "12 Rules for Life",
    author: "Jordan B. Peterson",
    price: 4000,
    category: BookCategory.others,
    shortTitle: "Woke Mind Virus",
  ),
  Book(
    title: "Colorade, My Home!",
    author: "Maye Musk",
    price: 3200,
    category: BookCategory.others,
    shortTitle: "Colorado, My Home",
  ),
  Book(
    title: "What is a Woman",
    author: "Matt Walsh",
    price: 3000,
    category: BookCategory.others,
    shortTitle: "What is a Woman",
  ),
  Book(
    title: "12 Rules for Life",
    author: "Jordan B. Peterson",
    price: 4000,
    category: BookCategory.others,
    shortTitle: "Woke Mind Virus",
  ),
  Book(
    title: "Colorade, My Home!",
    author: "Maye Musk",
    price: 3200,
    category: BookCategory.others,
    shortTitle: "Colorado, My Home",
  ),
  Book(
    title: "What is a Woman",
    author: "Matt Walsh",
    price: 3000,
    category: BookCategory.others,
    shortTitle: "What is a Woman",
  ),
  Book(
    title: "12 Rules for Life",
    author: "Jordan B. Peterson",
    price: 4000,
    category: BookCategory.others,
    shortTitle: "Woke Mind Virus",
  ),
  Book(
    title: "Colorade, My Home!",
    author: "Maye Musk",
    price: 3200,
    category: BookCategory.others,
    shortTitle: "Colorado, My Home",
  ),
  Book(
    title: "What is a Woman",
    author: "Matt Walsh",
    price: 3000,
    category: BookCategory.others,
    shortTitle: "What is a Woman",
  ),
  Book(
    title: "12 Rules for Life",
    author: "Jordan B. Peterson",
    price: 4000,
    category: BookCategory.others,
    shortTitle: "Woke Mind Virus",
  ),
  Book(
    title: "Colorade, My Home!",
    author: "Maye Musk",
    price: 3200,
    category: BookCategory.others,
    shortTitle: "Colorado, My Home",
  ),
  Book(
    title: "What is a Woman",
    author: "Matt Walsh",
    price: 3000,
    category: BookCategory.others,
    shortTitle: "What is a Woman",
  ),
  Book(
    title: "12 Rules for Life",
    author: "Jordan B. Peterson",
    price: 4000,
    category: BookCategory.others,
    shortTitle: "Woke Mind Virus",
  ),
  Book(
    title: "Colorade, My Home!",
    author: "Maye Musk",
    price: 3200,
    category: BookCategory.others,
    shortTitle: "Colorado, My Home",
  ),
  Book(
    title: "What is a Woman",
    author: "Matt Walsh",
    price: 3000,
    category: BookCategory.others,
    shortTitle: "What is a Woman",
  ),
  Book(
    title: "12 Rules for Life",
    author: "Jordan B. Peterson",
    price: 4000,
    category: BookCategory.others,
    shortTitle: "Woke Mind Virus",
  ),
  Book(
    title: "Colorade, My Home!",
    author: "Maye Musk",
    price: 3200,
    category: BookCategory.others,
    shortTitle: "Colorado, My Home",
  ),
  Book(
    title: "What is a Woman",
    author: "Matt Walsh",
    price: 3000,
    category: BookCategory.others,
    shortTitle: "What is a Woman",
  ),
  Book(
    title: "12 Rules for Life",
    author: "Jordan B. Peterson",
    price: 4000,
    category: BookCategory.others,
    shortTitle: "Woke Mind Virus",
  ),
  Book(
    title: "Colorade, My Home!",
    author: "Maye Musk",
    price: 3200,
    category: BookCategory.others,
    shortTitle: "Colorado, My Home",
  ),
  Book(
    title: "What is a Woman",
    author: "Matt Walsh",
    price: 3000,
    category: BookCategory.others,
    shortTitle: "What is a Woman",
  ),
  Book(
    title: "12 Rules for Life",
    author: "Jordan B. Peterson",
    price: 4000,
    category: BookCategory.others,
    shortTitle: "Woke Mind Virus",
  ),
  Book(
    title: "Colorade, My Home!",
    author: "Maye Musk",
    price: 3200,
    category: BookCategory.others,
    shortTitle: "Colorado, My Home",
  ),
  Book(
    title: "What is a Woman",
    author: "Matt Walsh",
    price: 3000,
    category: BookCategory.others,
    shortTitle: "What is a Woman",
  ),
  Book(
    title: "12 Rules for Life",
    author: "Jordan B. Peterson",
    price: 4000,
    category: BookCategory.others,
    shortTitle: "Woke Mind Virus",
  ),
  Book(
    title: "Colorade, My Home!",
    author: "Maye Musk",
    price: 3200,
    category: BookCategory.others,
    shortTitle: "Colorado, My Home",
  ),
];
