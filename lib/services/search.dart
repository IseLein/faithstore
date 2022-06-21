import 'package:faithstore/services/book.dart';

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
}