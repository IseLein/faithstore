import 'package:flutter/material.dart';
import 'package:faithstore/services/cart_item.dart';

class HomeCartItems extends StatefulWidget {
  const HomeCartItems({Key? key, required this.cartItemsList}) : super(key: key);

  final List<CartItem> cartItemsList;

  @override
  State<HomeCartItems> createState() => _HomeCartItemsState();
}

class _HomeCartItemsState extends State<HomeCartItems> {

  @override
  Widget build(BuildContext context) {
    return widget.cartItemsList.isEmpty
      ? Center(
          child: ListView(
            shrinkWrap: true,
            children: const [
              SizedBox(height: 20.0),
              Text(
                'No items in cart',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ],
          )
      )
      : ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.cartItemsList.length,
          itemBuilder: (BuildContext context, int index) {
            List<CartItem> cartItems = widget.cartItemsList;
            return cartItems[index].renderCartItemWidget(context);
          },
      );
  }
}