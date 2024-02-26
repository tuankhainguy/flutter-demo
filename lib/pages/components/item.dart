import 'package:demo/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:demo/constants.dart';
import 'package:demo/models/product.dart';


typedef ViewCallBack = void Function();
typedef ViewSetState = void Function(Widget widget);
typedef PageCallBack = void Function(int selectedPageIndex);

class ItemGrid extends StatelessWidget {
  final List<Product> products;
  final ViewSetState addItem;
  final ViewCallBack itemView, returnHome;
  const ItemGrid({
    Key? key,
    required this.products,
    required this.addItem,
    required this.itemView,
    required this.returnHome,
  }) : super(key: key);

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
          addItem: addItem,
          itemView: itemView,
          returnHome: returnHome,
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final Product product;
  final ViewSetState addItem;
  final ViewCallBack itemView, returnHome;
  const ItemCard({
    Key? key,
    required this.product,
    required this.addItem,
    required this.itemView,
    required this.returnHome,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        addItem(
          ItemPage(
            product: product,
            addItem: addItem,
            itemView: itemView,
            returnHome: returnHome
          )
        );
        itemView();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(kDefaultPadding / 4),
              decoration: BoxDecoration(
                color: kLightBackgroundColor,
                borderRadius: BorderRadius.circular(16.0)
              ),
              child: Image.asset(
                product.image,
                fit: BoxFit.fitWidth,
              ),
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
      ),
    );
  }
}

class ItemPage extends StatefulWidget {
  final Product product;
  final ViewSetState addItem;
  final ViewCallBack itemView, returnHome;
  const ItemPage({
    Key? key,
    required this.product,
    required this.addItem,
    required this.itemView,
    required this.returnHome,
  }) : super(key: key);

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 500,
        height: 500,
        child: Image.asset(
          widget.product.image,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
