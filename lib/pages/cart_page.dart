import 'package:demo/constants.dart';
import 'package:demo/main.dart';
import 'package:demo/pages/components/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:demo/models/product.dart';


class CartPage extends StatefulWidget {
  final PageCallBack pageJump;
  const CartPage({Key? key, required this.pageJump}) : super(key: key);

  @override
  State<CartPage> createState() => _CartState();
}

class _CartState extends State<CartPage> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => false;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    int subTotal = 0;
    cart.forEach((key, value) => subTotal += key.price * value);

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: buildAppBar(widget.pageJump, 4),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding / 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: kDefaultPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: kDefaultPadding / 1.5,
                        horizontal: kDefaultPadding / 2,
                      ),
                      decoration: const BoxDecoration(
                        color: kBaseColor,
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              text: "Subtotal \$",
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: kTextLight,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: subTotal.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: kDefaultPadding * 1.5),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                              });
                            },
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 40,
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: kDefaultPadding,
                                      vertical: kDefaultPadding / 2
                                    ),
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20.0)
                                      ),
                                      color: kCheckOutColor,
                                    ),
                                    child: RichText(
                                      text: TextSpan(
                                        text: "Checkout ",
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                          color: kTextDark,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: "(${cart.values.fold(
                                              0, (prev, curr) => prev + curr
                                            )})",
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cart.length,
                itemBuilder: (BuildContext context, int index) => Card(
                  color: const Color(0xfff5e0dc),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
                    leading: SizedBox(
                      height: 40,
                      width: 40,
                      child: Image.asset(
                        cart.keys.elementAt(index).image,
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    title: Text(
                      cart.keys.elementAt(index).title,
                      style: const TextStyle(
                        color: kTextDark,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 20.0,
                          width: 20.0,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                cart.values.elementAt(index) > 1
                                  ? cart.update(
                                    cart.keys.elementAt(index),
                                    (value) => --value
                                  )
                                  : cart.remove(cart.keys.elementAt(index));
                              });
                            },
                            icon: const Icon(
                              Icons.remove,
                              size: 15.0,
                              color: kTextDark,
                            ),
                            padding: EdgeInsets.zero,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
                          child: Text(cart.values.elementAt(index).toString()),
                        ),
                        SizedBox(
                          height: 20.0,
                          width: 20.0,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                cart.update(
                                  cart.keys.elementAt(index),
                                  (value) => ++value
                                );
                              });
                            },
                            icon: const Icon(
                              Icons.add,
                              size: 15.0,
                              color: kTextDark,
                            ),
                            padding: EdgeInsets.zero,
                          ),
                        ),
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 24.0,
                          width: 24.0,
                          child: IconButton(
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                            icon: const Icon(
                              Icons.shopping_cart_checkout_rounded,
                              size: 20.0,
                              color: kTextDark,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 24.0,
                          width: 24.0,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                cart.remove(cart.keys.elementAt(index));
                              });
                            },
                            padding: EdgeInsets.zero,
                            icon: const Icon(
                              Icons.close_rounded,
                              size: 20.0,
                              color: kTextDark,
                            ),
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
}
