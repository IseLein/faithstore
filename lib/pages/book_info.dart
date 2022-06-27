import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:faithstore/services/book.dart';
import 'package:faithstore/services/data.dart';
import 'package:faithstore/services/navigator.dart';
import 'package:faithstore/services/search.dart';

class BookInfo extends StatefulWidget {
  const BookInfo({Key? key, required this.bookId}) : super(key: key);

  final String bookId;

  @override
  State<BookInfo> createState() => _BookInfoState();
}

class _BookInfoState extends State<BookInfo> {
  late Book book;

  @override
  initState() {
    book = Search.getBook(widget.bookId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController quantityController = TextEditingController();
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: Theme.of(context).dividerColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Book"),
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.penToSquare),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Center(
              child: Card(
                child: Image.asset(
                  book.image,
                  height: 200.0,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            _bookProperty('Title', book.title),
            _bookProperty('Author', book.author),
            _bookProperty('Category', '${book.category}'.substring(13)),
            _bookProperty('Amount Left', '${book.quantityLeft}'),
            _bookProperty('price', '${book.price}'),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: TextFormField(
                controller: quantityController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                decoration: const InputDecoration(
                  label: Text('Quantity'),
                  hintText: 'Quantity',
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.only(left: 35.0, right: 35.0),
              child: Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).scaffoldBackgroundColor
                    ),
                  ),
                  onPressed: () {
                    try {
                      int quantity = int.parse(quantityController.text);
                      bool isAdded = Data.addCartItem(book, quantity, 'Faith');
                      _showBottomPanel(context, isAdded, quantity: quantity);
                    } on FormatException {
                      _showBottomPanel(context, false);
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.cartShopping,
                          color: Theme.of(context).dividerColor,
                        ),
                        const SizedBox(width: 10.0),
                        Text(
                          'Add to Cart',
                          style: TextStyle(
                            color: Theme.of(context).dividerColor,
                            fontSize: 17.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showBottomPanel(BuildContext context, bool state, {int quantity = 0}) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      context: context,
      builder: (context) {
        return state
            ? SizedBox(
                height: 300,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$quantity',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          (quantity == 1)
                              ? const Text(' book added')
                              : const Text(' books added'),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Cart Total: ',
                            style: TextStyle(
                              fontSize: 22.0,
                            ),
                          ),
                          const Text(
                            'N',
                            style: TextStyle(
                              fontSize: 22.0,
                            ),
                          ),
                          Text(
                            '${Data.getCartTotal()}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25.0),
                      ElevatedButton(
                        onPressed: () {
                          AppNavigator.goToCheckout(context);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).scaffoldBackgroundColor,
                          ),
                          foregroundColor: MaterialStateProperty.all(
                            Theme.of(context).dividerColor,
                          ),
                        ),
                        child: const Text('GO TO CHECKOUT'),
                      ),
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () {
                          AppNavigator.goToHome(context);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).scaffoldBackgroundColor,
                          ),
                          foregroundColor: MaterialStateProperty.all(
                            Theme.of(context).dividerColor,
                          ),
                        ),
                        child: const Text('ADD MORE BOOKS'),
                      ),
                    ],
                  ),
                ),
              )
            : SizedBox(
                height: 300,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(FontAwesomeIcons.triangleExclamation, size: 50.0),
                        SizedBox(height: 15.0),
                        Text(
                          'Check the number of Books you are trying to sell',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }

  Widget _bookProperty(String property, String value) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$property:',
              style: const TextStyle(
                // fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              ),
            ),
            SizedBox(
              width: 230.0,
              child: Text(
                value,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  // fontSize: 20.0,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 1.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}