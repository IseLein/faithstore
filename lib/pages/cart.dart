import 'package:flutter/material.dart';
import 'package:faithstore/services/data.dart';
import 'package:faithstore/widgets/home_cart_items.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView(
        children: [
          Container(
            color: const Color.fromRGBO(208, 208, 208, 1.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const Text(
                        'Subtotal: ',
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                      const Text(
                        'N',
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                      Text(
                        '${Data.getCartTotal()}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26.0,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      top: 8.0,
                      bottom: 8.0,
                    ),
                    child: Text(
                      'Checkout',
                      style: TextStyle(
                        fontSize: 28.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${Data.cartItems.length}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(' books'),
                  ],
                ),
                const SizedBox(height: 8.0),
              ],
            ),
          ),
          HomeCartItems(cartItemsList: Data.getCart()),
        ],
      ),
    );
  }
}
