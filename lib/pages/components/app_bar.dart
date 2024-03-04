import 'package:flutter/material.dart';
import 'package:demo/constants.dart';


AppBar buildAppBar(PageCallBack pageJump, [int? currentPageIndex,
                    bool? viewingProduct, ViewCallBack? returnHome]){
  Color textColor;
  Widget? leading;
  Widget? title;

  if (viewingProduct == true) {
    textColor = kTextDark;
    leading = IconButton(
      onPressed: () => returnHome != null ? returnHome() : null,
      icon: const Icon(
        Icons.arrow_back_ios_new,
        color: kTextDark,
      )
    );
  } else {
    textColor = kTextLight;
    title = const Text(
      "Demo",
      style: TextStyle(
        color: kTextLight,
        fontSize: 24.0,
      ),
    );
  }

  return AppBar(
    backgroundColor: Colors.transparent,
    title: title,
    centerTitle: true,
    leading: leading,
    actions: <Widget>[
      IconButton(
        onPressed: () => currentPageIndex == 4 ? null : pageJump(4),
        icon: currentPageIndex == 4 ?
          const Icon(Icons.shopping_cart) :
          const Icon(Icons.shopping_cart_outlined),
        color: textColor,
      ),
      const SizedBox(width: kDefaultPadding / 2),
    ],
  );
}
