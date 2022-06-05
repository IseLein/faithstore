import 'package:flutter/material.dart';
import 'package:faithstore/services/book.dart';

class HomeBooks extends StatelessWidget {
  const HomeBooks({
    Key? key, required this.bookCategory,  required this.thisBookList
  }) : super(key: key);

  final BookCategory bookCategory;
  final List<Book> thisBookList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: thisBookList.length,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 2.0,
        childAspectRatio: 0.63,
        crossAxisCount: 2,
      ),
      itemBuilder: (BuildContext context, int index) {
        Book book = thisBookList[index];
        return book.renderHomeBook();
      },
    );
  }
}