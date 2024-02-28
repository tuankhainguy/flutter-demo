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
  late List<Widget> pages;

  @override
  void initState() {
    super.initState();

    currentPageIndex = 0;

    pageController = PageController(initialPage: currentPageIndex);

    pages = [
      HomePage(pageJump: pageJump),
      AccountPage(pageJump: pageJump),
      NotificationPage(pageJump: pageJump),
      const SearchPage(),
      CartPage(pageJump: pageJump),
    ];
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void pageJump(int selectedPageIndex) {
    setState(() {
      currentPageIndex = selectedPageIndex;
      pageController.jumpToPage(selectedPageIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      // appBar: [0, 1, 2, 4].contains(currentPageIndex) ? buildAppBar() : null,
      extendBody: true,
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
          onPressed: () => pageJump(4),
          icon: currentPageIndex == 4 ?
            const Icon(Icons.shopping_cart) :
            const Icon(Icons.shopping_cart_outlined),
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
        // mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 60,
            width: 80,
            child: IconButton(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
              onPressed: () => pageJump(0),
              icon: currentPageIndex == 0 ?
                buildNavigationIcon(const Icon(Icons.home), "Home", 0) :
                buildNavigationIcon(const Icon(Icons.home_outlined), "Home", 0),
              color: currentPageIndex == 0 ? kHighlightColor : kTextOverlay,
            ),
          ),
          SizedBox(
            height: 60,
            width: 80,
            child: IconButton(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
              onPressed: () => pageJump(1),
              icon: currentPageIndex == 1 ?
                buildNavigationIcon(const Icon(Icons.account_circle), "You", 1) :
                buildNavigationIcon(const Icon(Icons.account_circle_outlined), "You", 1),
              color: currentPageIndex == 1 ? kHighlightColor : kTextOverlay,
            ),
          ),
          SizedBox(
            height: 60,
            width: 80,
            child: IconButton(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
              onPressed: () => pageJump(2),
              icon: currentPageIndex == 2 ?
                buildNavigationIcon(
                  buildNotificationBadge(
                    true,
                    Icons.notifications_sharp,
                    Colors.transparent
                  ),
                  "Notification",
                  2
                ) :
                buildNavigationIcon(
                  buildNotificationBadge(
                    true,
                    Icons.notifications_outlined,
                    kNotificationColor
                  ),
                  "Notification",
                  2
                ),
              color: currentPageIndex == 2 ? kHighlightColor : kTextOverlay,
            ),
          ),
          SizedBox(
            height: 60,
            width: 80,
            child: IconButton(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
              onPressed: () => pageJump(3),
              icon: currentPageIndex == 3 ?
                buildNavigationIcon(const Icon(Icons.search_rounded), "Search", 3) :
                buildNavigationIcon(const Icon(Icons.search_outlined), "Search", 3),
              color: currentPageIndex == 3 ? kHighlightColor : kTextOverlay,
            ),
          ),
        ],
      )
    );
  }

  Column buildNavigationIcon(Widget buttonIcon, String label, int pageIndex) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        buttonIcon,
        Text(
          label,
          style: TextStyle(
            color: currentPageIndex == pageIndex ? kHighlightColor : kTextOverlay,
            fontSize: 10.0,
          ),
        ),
      ],
    );
  }

  Badge buildNotificationBadge(bool isVisible, IconData buttonIcon, Color? color) {
    return Badge(
      isLabelVisible: isVisible,
      backgroundColor: color,
      child: Icon(buttonIcon),
    );
  }
}
