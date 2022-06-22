import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:faithstore/pages/cart.dart';
import 'package:faithstore/services/book.dart';
import 'package:faithstore/services/sale.dart';
import 'package:faithstore/services/data.dart';

class CartItem {
  Book book;
  int quantity;
  String trader;

  CartItem({required this.book, required this.quantity, required this.trader});

  Sale toSale() {
    return Sale(
      book: book,
      saleTime: DateTime.now(),
      quantity: quantity,
      trader: trader,
    );
  }

  void editQuantity(int quantity) {
    if (this.quantity < quantity) {
      if (book.reduceQuantity(quantity - this.quantity)) {
        this.quantity = quantity;
      }
    } else if (this.quantity > quantity) {
      book.increaseQuantity(this.quantity - quantity);
      this.quantity = quantity;
    }
  }

  Widget renderCartItemWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {},
        child: Card(
          elevation: 2.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          book.shortTitle,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            letterSpacing: 1.0,
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          'N${book.price}',
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            letterSpacing: 1.0,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        )
                      ],
                    ),
                    Center(
                      child: Text(
                        '$quantity',
                        style: const TextStyle(
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.bold,
                          fontSize: 28.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(208, 208, 208, 1.0)
                        ),
                      ),
                      onPressed: () {
                        Data.deleteCartItem(this);
                        book.quantityLeft += quantity;
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CartPage(),
                          ),
                        );
                      },
                      child: Row(
                        children: const [
                          Icon(FontAwesomeIcons.trashCan),
                          Text('DELETE'),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(208, 208, 208, 1.0)
                        ),
                      ),
                      onPressed: () {
                        _showEditPanel(context);
                      },
                      child: Row(
                        children: const [
                          Icon(FontAwesomeIcons.penToSquare),
                          Text('EDIT'),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(208, 208, 208, 1.0)
                        ),
                      ),
                      onPressed: () {
                        Data.deleteCartItem(this);
                        Data.addSale(toSale());
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CartPage(),
                          ),
                        );
                      },
                      child: Row(
                        children: const [
                          Icon(FontAwesomeIcons.checkDouble),
                          Text('SELL'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showEditPanel(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        TextEditingController quantityText = TextEditingController(
            text: quantity.toString()
        );
        return SizedBox(
          height: 300,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Book quantity',
                  style: TextStyle(
                    fontSize: 22.0,
                  ),
                ),
                const SizedBox(height: 15.0),
                IconButton(
                  onPressed: () {
                    quantityText.value = TextEditingValue(
                        text: (int.parse(quantityText.text) + 1).toString()
                    );
                    editQuantity(int.parse(quantityText.text));
                    _updateState(context);
                  },
                  icon: const Icon(FontAwesomeIcons.angleUp),
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: quantityText,
                    onSubmitted: (value) {
                      editQuantity(int.parse(quantityText.text));
                      _updateState(context);
                    },
                  ),
                ),
                const SizedBox(height: 10.0),
                IconButton(
                  onPressed: () {
                    if (int.parse(quantityText.text) > 0) {
                      quantityText.value = TextEditingValue(
                          text: (int.parse(quantityText.text) - 1).toString()
                      );
                      editQuantity(int.parse(quantityText.text));
                      _updateState(context);
                    }
                  },
                  icon: const Icon(FontAwesomeIcons.angleDown),
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  void _updateState(BuildContext context) {
    Navigator.pop(context);
    Navigator.pop(context);
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CartPage())
    );
    _showEditPanel(context);
  }
}