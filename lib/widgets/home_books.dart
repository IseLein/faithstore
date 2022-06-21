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
    return thisBookList.isEmpty
      ? Center(
          child: ListView(
            shrinkWrap: true,
            children: const [
              SizedBox(height: 20.0),
              Text(
                'No books found',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
      )
      : GridView.builder(
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
            return book.renderHomeBook(context);
        },
      );
  }
}