import 'package:demo/constants.dart';
import 'package:flutter/material.dart';
import 'package:demo/models/product.dart';
import 'package:demo/pages/components/item.dart';
import 'package:demo/pages/components/app_bar.dart';


class HomePage extends StatefulWidget {
  final PageCallBack pageJump;
  const HomePage({Key? key, required this.pageJump}) : super(key: key);

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> with AutomaticKeepAliveClientMixin {

  late PageController itemViewer;
  late List<Widget> views;
  bool viewing = false;
  final int homePageIndex = 0;
  final int itemPageIndex = 1;

  void addItem(Widget widget) {
    views.add(widget);
  }

  void itemView() {
    setState(() {
      itemViewer.animateToPage(
        itemPageIndex,
        duration: Durations.short4,
        curve: Curves.easeInOut,
      );
      viewing = true;
    });
  }

  void returnHome() {
    setState(() {
      itemViewer.animateToPage(
        homePageIndex,
        duration: Durations.short4,
        curve: Curves.easeInOut,
      );
      views.length > 1 ? views.removeLast() : null;
      viewing = false;
    });
  }

  @override
  void initState() {
    super.initState();

    itemViewer = PageController(initialPage: homePageIndex);
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
    itemViewer.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: buildAppBar(widget.pageJump, 0, viewing, returnHome),
      body: PageView(
        controller: itemViewer,
        children: views,
      ),
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

class _CategoriesState extends State<Categories> with AutomaticKeepAliveClientMixin{

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
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
