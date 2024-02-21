import 'package:flutter/material.dart';
import 'package:demo/constants.dart';
import 'package:demo/screens/cart_screen.dart';
import 'package:demo/screens/home_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: buildBottomAppBar(),
      body: Navigator(
        onGenerateRoute: (settings) {
          Widget screen = HomeScreen();
          if (settings.name == 'cart') screen = CartScreen();
          return MaterialPageRoute(builder: (_) => page);
        },
      ),
    );
  }

  BottomAppBar buildBottomAppBar() {
    return BottomAppBar(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      height: 60,
      color: kBaseColor,
      surfaceTintColor: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                onPressed: () => setState(() {
                  currentPageIndex = 0;
                }),
                icon: currentPageIndex == 0 ? Icon(Icons.home) : Icon(Icons.home_outlined),
                color: currentPageIndex == 0 ? kHighlightColor : kTextOverlay,
                visualDensity: const VisualDensity(vertical: -4.0),
              ),
              Text(
                "Home",
                style: TextStyle(
                  color: currentPageIndex == 0 ? kHighlightColor : kTextOverlay,
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                onPressed: () => setState(() {
                  currentPageIndex = 1;
                }),
                icon: currentPageIndex == 1 ? Icon(Icons.account_circle) : Icon(Icons.account_circle_outlined),
                color: currentPageIndex == 1 ? kHighlightColor : kTextOverlay,
                visualDensity: const VisualDensity(vertical: -4.0),
              ),
              Text(
                "You",
                style: TextStyle(
                  color: currentPageIndex == 1 ? kHighlightColor : kTextOverlay,
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                onPressed: () => setState(() {
                  currentPageIndex = 2;
                }),
                icon: currentPageIndex == 2 ? Icon(Icons.search_sharp) : Icon(Icons.search_outlined),
                color: currentPageIndex == 2 ? kHighlightColor : kTextOverlay,
                visualDensity: const VisualDensity(vertical: -4.0),
              ),
              Text(
                "Search",
                style: TextStyle(
                  color: currentPageIndex == 2 ? kHighlightColor : kTextOverlay,
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                onPressed: () => setState(() {
                  currentPageIndex = 3;
                }),
                icon: currentPageIndex == 3 ? Icon(Icons.shopping_cart) : Icon(Icons.shopping_cart_outlined),
                color: currentPageIndex == 3 ? kHighlightColor : kTextOverlay,
                visualDensity: const VisualDensity(vertical: -4.0),
              ),
              Text(
                "Cart",
                style: TextStyle(
                  color: currentPageIndex == 3 ? kHighlightColor : kTextOverlay,
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
        ],
      )
    );

}
