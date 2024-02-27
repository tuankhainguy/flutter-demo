import 'package:flutter/material.dart';
import 'package:demo/constants.dart';


AppBar buildAppBar(PageCallBack pageJump, int currentPageIndex,
                    [bool? viewingProduct, ViewCallBack? returnHome]){
  return AppBar(
    backgroundColor: Colors.transparent,
    title: const Text(
      "Demo",
      style: TextStyle(
        color: kTextLight,
        fontSize: 24.0,
      ),
    ),
    centerTitle: true,
    leading: viewingProduct == true ? IconButton(
      onPressed: () => returnHome != null ? returnHome() : null,
      icon: const Icon(
        Icons.arrow_back_ios_new,
        color: kTextLight,
      ),
    ) : null,
    // IconButton(
    //   onPressed: () {},
    //   icon: const Icon(Icons.menu),
    //   color: kTextLight,
    // ) : null,
    actions: <Widget>[
      IconButton(
        onPressed: () => currentPageIndex == 4 ? null : pageJump(4),
        icon: currentPageIndex == 4 ?
          const Icon(Icons.shopping_cart) :
          const Icon(Icons.shopping_cart_outlined),
        color: kTextLight,
      ),
      const SizedBox(width: kDefaultPadding / 2),
    ],
  );
}
