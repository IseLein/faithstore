import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:faithstore/services/book.dart';
import 'package:faithstore/services/data.dart';
import 'package:faithstore/services/navigator.dart';

class BookInfo extends StatelessWidget {
  const BookInfo({Key? key, required this.book}) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    TextEditingController quantityController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book"),
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
                  onPressed: () {
                    try {
                      int quantity = int.parse(quantityController.text);
                      bool isAdded = Data.addCartItem(book, quantity, 'Faith');
                      _showBottomPanel(context, isAdded, quantity: quantity);
                    } on FormatException {
                      _showBottomPanel(context, false);
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(FontAwesomeIcons.cartShopping),
                      SizedBox(width: 10.0),
                      Text('Add to Cart'),
                    ],
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
                              ? const Text(' book'): const Text(' books'),
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
                        child: const Text('GO TO CHECKOUT'),
                      ),
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () {
                          AppNavigator.goToHome(context);
                        },
                        child: const Text('ADD MORE BOOKS'),
                      ),
                    ],
                  ),
                ),
              )
            : const SizedBox(
                height: 300,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Check the number of Books you are trying to sell',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26.0,
                      ),
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