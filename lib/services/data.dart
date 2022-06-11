import 'package:faithstore/services/sale.dart';
import 'package:faithstore/services/book.dart';
import 'package:faithstore/services/cart_item.dart';

class Data {
  static List<Book> phBookList = [];
  static List<Book> othersBookList = [];
  static List<Sale> salesList = [];
  static List<CartItem> cartItems = [];

  static void initData() {
    // TODO: Implement Firebase here
    for (int i = 0; i <= 43; i ++) {
      phBookList.add(
        Book(
          title: "What God looks for in His Vessel",
          author: "Gbile Akanni",
          price: 5000, category: BookCategory.peaceHouse,
          quantityLeft: 43,
          shortTitle: "Vessel",
          image: "assets/images/book_image.jpg",
        )
      );
    }
    for (int i = 0; i <= 43; i ++) {
      othersBookList.add(
          Book(
            title: "Secrets of the Secret Place",
            author: "Bob Sorge",
            price: 5000, category: BookCategory.others,
            quantityLeft: 32,
            shortTitle: "Secrets of the Secret Place",
            image: "assets/images/secrets.jpg",
          )
      );
    }

    cartItems.add(CartItem(book: othersBookList[0], quantity: 4, trader: 'LOL'));
  }

  static List<Book> getBooks(BookCategory category) {
    return (category == BookCategory.peaceHouse)
        ? phBookList
        : othersBookList;
  }

  static List<Sale> getSales() {
    return salesList;
  }

  static List<CartItem> getCart() {
    return cartItems;
  }

  static double getCartTotal() {
    double cartTotal = 0;
    for (var item in cartItems) {
      cartTotal += (item.quantity * item.book.price);
    }
    return cartTotal;
  }

  static bool addCartItem(Book book, int quantity, String trader) {
    if (book.reduceQuantity(quantity)) {
      cartItems.add(
        CartItem(
          book: book,
          quantity: quantity,
          trader: trader,
        )
      );
      return true;
    } else {
      return false;
    }
  }
}