import 'package:demo/constants.dart';
import 'package:flutter/material.dart';
import 'package:demo/models/product.dart';
import 'package:demo/pages/components/item.dart';


typedef ViewCallBack = void Function();
typedef ViewSetState = void Function(Widget widget);
typedef PageCallBack = void Function(int selectedPageIndex);

class HomePage extends StatefulWidget {
  final PageCallBack pageJump;
  const HomePage({Key? key, required this.pageJump}) : super(key: key);

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> with AutomaticKeepAliveClientMixin {

  late PageController pageViewer;
  late List<Widget> views;
  final int homePageIndex = 0;
  final int itemPageIndex = 1;

  void addItem(Widget widget) {
    views.add(widget);
  }

  void itemView() {
    setState(() {
      views.length > 1 ? views.removeRange(1, views.length - 1) : null;
      pageViewer.jumpToPage(itemPageIndex);
    });
  }

  void returnHome() {
    setState(() {
      pageViewer.jumpToPage(homePageIndex);
      views.length > 1 ? views.removeRange(1, views.length - 1) : null;
    });
  }

  @override
  void initState() {
    super.initState();

    pageViewer = PageController(initialPage: homePageIndex);
    views = [
      HomeView(
        pageJump: widget.pageJump,
        addItem: addItem,
        itemView: itemView,
        returnHome: returnHome,
      ),
    ];
  }

  @override
  void dispose() {
    pageViewer.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return PageView(
      controller: pageViewer,
      children: views,
    );
  }
}

class HomeView extends StatelessWidget {
  final PageCallBack pageJump;
  final ViewSetState addItem;
  final ViewCallBack itemView, returnHome;
  const HomeView({
    Key? key,
    required this.pageJump,
    required this.addItem,
    required this.itemView,
    required this.returnHome,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        buildSearchBar(),
        const SizedBox(height: kDefaultPadding / 1.5),
        Categories(addItem: addItem, itemView: itemView, returnHome: returnHome,),
      ]
    );
  }

  Padding buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: GestureDetector(
        onTap: () => pageJump(3),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: kBaseColor,
          ),
          height: 40,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
          child: const Row(
            children: [
              Icon(Icons.search_rounded, color: kTextLight),
              SizedBox(width: kDefaultPadding / 3),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Text(
                  "Search",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: kTextOverlay,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Categories extends StatefulWidget {
  final ViewSetState addItem;
  final ViewCallBack itemView, returnHome;
  const Categories({
    Key? key,
    required this.addItem,
    required this.itemView,
    required this.returnHome,
  }) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  final Map<String, List<Product>> categories = {
    "Hot deals!": hotDeals,
    "New arrivals!": newArrivals,
    "PC": pc,
    "Mobile": mobile,
    "Handbags": handbags,
    "Backpacks": backpacks,
    "Accessories": accessories,
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,
      child: Expanded(
        child: Column(
          children: <Widget>[
            TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
              labelPadding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
              labelColor: kHighlightColor,
              unselectedLabelColor: kTextOverlay,
              indicatorColor: kHighlightColor,
              dividerHeight: 0.0,
              tabs: categories.keys.map(
                (category) => Text(category)
              ).toList(),
            ),
            Expanded(
              child: TabBarView(
                children: categories.values.map(
                  (list) => ItemGrid(
                    products: list,
                    addItem: widget.addItem,
                    itemView: widget.itemView,
                    returnHome: widget.returnHome,
                  ),
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
