import 'package:demo/constants.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartState();
}

class _CartState extends State<CartPage> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Card(
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
              leading: Icon(Icons.shopping_bag),
              title: Text('Purchase 1'),
              subtitle: Text('This is a purchase'),
              trailing: Icon(Icons.shopping_cart_checkout_rounded),
            ),
          ),
          Card(
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
              leading: Icon(Icons.shopping_bag),
              title: Text('Purchase 2'),
              subtitle: Text('This is a purchase'),
              trailing: Icon(Icons.shopping_cart_checkout_rounded),
            ),
          ),
        ],
      ),
    );
  }
}
