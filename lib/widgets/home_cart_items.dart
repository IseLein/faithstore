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
    return ListView.builder(
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