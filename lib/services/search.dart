import 'package:faithstore/services/data.dart';
import 'package:faithstore/services/book.dart';
import 'package:faithstore/services/sale.dart';

class Search {
  static List<Book> searchBooks(String searchText, List<Book> books) {
    if (searchText.startsWith('a:')){
      return Search.searchBookAuthor(searchText.substring(2), books);
    } else {
      return books
          .where((book) =>
          book.title.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    }
  }

  static List<Book> searchBookAuthor(String author, List<Book> books) {
    return books
        .where((book) =>
        book.author.toLowerCase().contains(author.toLowerCase()))
        .toList();
  }

  /// Return the book with the given [id].
  /// Precondition: There must be a book in [Data.phBookList]
  /// or [Data.othersBookList] with the given [id]
  static Book getBook(String id) {
    for (Book book in Data.phBookList) {
      if (id == book.getId()) {
        return book;
      }
    }
    for (Book book in Data.othersBookList) {
      if (id == book.getId()) {
        return book;
      }
    }
    return Book(
      id: id,
      title: 'title',
      author: 'author',
      price: 1,
      category: BookCategory.peaceHouse,
      quantityLeft: 1,
      shortTitle: 'short title',
      image: 'image',
    );
  }

  ///Return the sale with the given [id].
  /// Precondition: There must be a book in [Data.salesList]
  static Sale getSale(String id) {
    for (Sale sale in Data.salesList) {
      if (id == sale.id) {
        return sale;
      }
    }
    return Sale(
      id: id,
      bookId: 'bookId',
      saleTime: DateTime.now(),
      quantity: 1,
      trader: 'trader',
    );
  }
}