import 'package:flutter/material.dart';
import 'package:demo/constants.dart';
import 'package:demo/models/product.dart';


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
            returnHome: returnHome,
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
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: kDefaultPadding / 3),
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
  final ViewCallBack returnHome;
  const ItemPage({
    Key? key,
    required this.product,
    required this.returnHome,
  }) : super(key: key);

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightBackgroundColor,
      body: ItemPageBody(product: widget.product),
    );
  }
}

class ItemPageBody extends StatefulWidget{
  final Product product;
  const ItemPageBody({Key? key, required this.product}) : super(key: key);

  @override
  State<ItemPageBody> createState() => _ItemPageBodyState();
}

class _ItemPageBodyState extends State<ItemPageBody> {
  int currentColorIndex = 0;
  String addToCart = "Add to Cart";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: SizedBox(
                  height: size.height * 0.4,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: <Widget>[
                      Image.asset(
                        widget.product.image,
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.topCenter,
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            favourites.contains(widget.product)
                              ? favourites.remove(widget.product)
                              : favourites.add(widget.product);
                          });
                        },
                        icon: favourites.contains(widget.product)
                          ? const Icon(
                            Icons.favorite,
                              color: kTextDark,
                          )
                          : const Icon(
                            Icons.favorite_outline,
                              color: kTextDark,
                          ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                // margin: EdgeInsets.only(top: size.height * 0.5),
                padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                  vertical: kDefaultPadding / 1.5
                ),
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                decoration: const BoxDecoration(
                  color: kBackgroundColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          widget.product.title,
                          style: const TextStyle(
                            color: kTextLight,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: kDefaultPadding / 2),
                    const Row(
                      children: <Widget>[
                        Icon(
                          Icons.account_circle,
                          color: kTextOverlay,
                        ),
                        SizedBox(width: kDefaultPadding / 3),
                        Text(
                          "seller",
                          style: TextStyle(
                            color: kTextOverlay,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: kDefaultPadding / 3),
                    Text(
                      "\$${widget.product.price}",
                      style: const TextStyle(
                        color: kTextLight,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: kDefaultPadding / 3),
                    const Text(
                      "Colors",
                      style: TextStyle(
                        color: kTextLight,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: List.generate(
                        widget.product.color.length,
                        (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              currentColorIndex = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: Durations.short4,
                            padding: const EdgeInsets.all(2.0),
                            margin: const EdgeInsets.fromLTRB(
                              0.0,
                              kDefaultPadding / 2,
                              kDefaultPadding / 2,
                              kDefaultPadding / 2,
                            ),
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent,
                              border: currentColorIndex == index
                                ? Border.all(color: widget.product.color[index])
                                : null,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: widget.product.color[index],
                              ),
                            )
                          )
                        ),
                      ),
                    ),
                    const SizedBox(height: kDefaultPadding / 2),
                    GestureDetector(
                      onTap: () {
                        switch (addToCart) {
                          case "Add to Cart":
                            setState(() {
                              addToCart = "Added";
                            });
                            cart.update(
                              widget.product,
                              (value) => ++value,
                              ifAbsent: () => 1,
                            );
                        }
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
                                color: kAddToCartColor,
                              ),
                              child: Text(
                                addToCart,
                                style: const TextStyle(
                                  color: kTextDark,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                              child: const Text(
                                "Checkout",
                                style: TextStyle(
                                  color: kTextDark,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: kDefaultPadding),
                    const Text(
                      "Description",
                      style: TextStyle(
                        color: kTextLight,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
