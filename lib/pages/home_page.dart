import 'package:demo/constants.dart';
import 'package:flutter/material.dart';
import 'package:demo/models/product.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: <Widget>[
        buildSearchBar(),
        const SizedBox(height: kDefaultPadding / 1.5),
        const Categories(),
      ]
    );
  }

  Padding buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: GestureDetector(
        onTap: () {
          setState(() {
          });
        },
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
  const Categories({Key? key}) : super(key: key);

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
                children: categories.values.map((list) => ItemGrid(products: list)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemGrid extends StatelessWidget {
  final List<Product> products;
  const ItemGrid({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: GridView.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 150,
          mainAxisSpacing: kDefaultPadding,
          crossAxisSpacing: kDefaultPadding,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) => ItemCard(
          product: products[index],
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final Product product;
  const ItemCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(kDefaultPadding),
            decoration: BoxDecoration(
              color: product.color,
              borderRadius: BorderRadius.circular(16.0)
            ),
            child: Image.asset(product.image),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
          child: Text(
            product.title,
            style: const TextStyle(
              color: kTextLight,
              fontSize: 15.0,
            ),
          ),
        ),
        Text(
          "\$${product.price.toString()}",
          style: const TextStyle(
            color: kTextOverlay,
            fontSize: 12.0,
          ),
        ),
      ],
    );
  }
}
