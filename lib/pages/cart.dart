import 'package:flutter/material.dart';
import 'package:faithstore/services/data.dart';
import 'package:faithstore/services/cart_item.dart';
import 'package:faithstore/services/navigator.dart';
import 'package:faithstore/widgets/home_cart_items.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

// class _CartPageState extends State<CartPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }


class _CartPageState extends State<CartPage> {

  late List<CartItem> cartList;

  @override
  initState() {
    cartList = Data.getCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).dividerColor,
        leading: const Icon(FontAwesomeIcons.store),
        title: const Text('Cart'),
      ),
      body: ListView(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
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
                    showDialog(
                      context: context,
                      builder: (context) => _confirmCheckout(context),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).scaffoldBackgroundColor
                    ),
                    foregroundColor: MaterialStateProperty.all(
                        Theme.of(context).dividerColor
                    ),
                  ),
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
                    (Data.cartItems.length == 1)
                      ? const Text(' book'): const Text(' books'),
                  ],
                ),
                const SizedBox(height: 8.0),
              ],
            ),
          ),
          HomeCartItems(cartItemsList: cartList),
        ],
      ),
    );
  }

  Widget _confirmCheckout(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirm Sale'),
      content: Text('Are you sure you want to sell ${Data.getBookNumber()} '
          '${_bookS(Data.getBookNumber())} for N${Data.getCartTotal()}'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('NO'),
        ),
        TextButton(
          onPressed: () {
            for (CartItem cartItem in cartList) {
              Data.addSale(cartItem.toSale());
            }
            Data.emptyCart();
            Navigator.pop(context);
            AppNavigator.navigate(1, context);
          },
          child: const Text('YES'),
        ),
      ],
    );
  }

  String _bookS(int num) {
    return (num == 1) ? 'book' : 'books';
  }
}
