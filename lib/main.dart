import 'package:flutter/material.dart';
import 'package:demo/constants.dart';
import 'package:demo/pages/cart_page.dart';
import 'package:demo/pages/home_page.dart';
import 'package:demo/pages/account_page.dart';
import 'package:demo/pages/search_page.dart';
import 'package:demo/pages/notification_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff1e1e2e)),
        useMaterial3: true,
      ),
      home: const Main(),
    );
  }
}


class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  late int currentPageIndex;
  late PageController pageController;
  // int notificationNum = 2;

  late List<Widget> pages;

  @override
  void initState() {
    super.initState();

    currentPageIndex = 0;

    pages = [
      const HomePage(),
      const AccountPage(),
      const NotificationPage(),
      const SearchPage(),
      const CartPage(),
    ];

    pageController = PageController(initialPage: currentPageIndex);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void update(int selectedPageIndex) {
    setState(() {
      currentPageIndex = selectedPageIndex;
      pageController.jumpToPage(selectedPageIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: [0, 1, 2, 4].contains(currentPageIndex) ? buildAppBar() : null,
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: pages,
      ),
      bottomNavigationBar: buildBottomAppBar(),
      // body: pages[currentPageIndex],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      toolbarHeight: 50.0,
      title: const Text(
        "Demo",
        style: TextStyle(
          color: kTextLight,
          fontSize: 24.0,
        ),
      ),
      centerTitle: true,
      // leading: IconButton(
      //   onPressed: () {},
      //   icon: const Icon(Icons.menu),
      //   color: kTextLight,
      // ),
      actions: <Widget>[
        IconButton(
          onPressed: () => update(4),
          icon: currentPageIndex == 4 ? Icon(Icons.shopping_cart) : Icon(Icons.shopping_cart_outlined),
          color: kTextLight,
        ),
        const SizedBox(width: kDefaultPadding / 2),
      ],
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
                onPressed: () => update(0),
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
                onPressed: () => update(1),
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
                onPressed: () => update(2),
                icon:  currentPageIndex == 2 ? const Badge(
                  isLabelVisible: false,
                  child: Icon(Icons.notifications_sharp),
                ) : const Badge(
                  isLabelVisible: true,
                  backgroundColor: kNotificationColor,
                  child: Icon(Icons.notifications_outlined),
                ),
                color: currentPageIndex == 2 ? kHighlightColor : kTextOverlay,
                visualDensity: const VisualDensity(vertical: -4.0),
              ),
              Text(
                "Cart",
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
                onPressed: () => update(3),
                icon: currentPageIndex == 3 ? Icon(Icons.search_sharp) : Icon(Icons.search_outlined),
                color: currentPageIndex == 3 ? kHighlightColor : kTextOverlay,
                visualDensity: const VisualDensity(vertical: -4.0),
              ),
              Text(
                "Search",
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
}
