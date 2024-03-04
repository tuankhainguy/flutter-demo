import 'package:demo/pages/components/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:demo/constants.dart';
import 'package:demo/models/product.dart';
import 'package:demo/pages/components/item.dart';


typedef SearchCallBack = void Function(bool);

class SearchPage extends StatefulWidget {
  final PageCallBack pageJump;
  const SearchPage({Key? key, required this.pageJump}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchState();
}

class _SearchState extends State<SearchPage> {

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
      SearchView(
        pageJump: widget.pageJump,
        addItem: addItem,
        itemView: itemView,
        returnHome: returnHome,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: itemViewer,
      children: views,
    );
  }
}

class SearchView extends StatefulWidget {
  final PageCallBack pageJump;
  final ViewSetState addItem;
  final ViewCallBack itemView, returnHome;
  const SearchView({
    Key? key,
    required this.pageJump,
    required this.addItem,
    required this.itemView,
    required this.returnHome,
  }) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> with AutomaticKeepAliveClientMixin {

  String search = "";
  List<Product> searchResults = [];
  final TextEditingController textController = TextEditingController();

  void filter() {
    search == "" ? searchResults.clear() : searchResults = allItems
      .where((product) => product.title.toLowerCase().contains(search.toLowerCase()))
      .toList();
  }

  @override
  bool get wantKeepAlive => search == "" ? false : true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    updateKeepAlive();

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(
            kDefaultPadding,
            kDefaultPadding,
            kDefaultPadding,
            0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: kBaseColor,
                  ),
                  height: 40,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
                  child: Row(
                    children: [
                      const Icon(Icons.search_rounded, color: kTextLight),
                      const SizedBox(width: kDefaultPadding / 3),
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: TextField(
                          onChanged: (input) {
                            setState(() {
                              search = input;
                              filter();
                            });
                          },
                          controller: textController,
                          autofocus: true,
                          decoration: const InputDecoration(
                            isDense: true,
                            hintText: "Search",
                            hintStyle: TextStyle(
                              color: kTextOverlay,
                              fontWeight: FontWeight.w500,
                            ),
                            border: InputBorder.none,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kTextOverlay),
                            ),
                          ),
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: kTextLight,
                          ),
                        ),
                      ),
                      const SizedBox(width: kDefaultPadding / 3),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            textController.clear();
                            search = "";
                            filter();
                          });
                        },
                        child: Icon(
                          search == "" ? null : Icons.cancel_rounded,
                          color: kTextLight,
                          size: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: kDefaultPadding / 2),
              GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: const Text(
                  "cancel",
                  style: TextStyle(
                    color: kHighlightColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ItemList(
            pageJump: widget.pageJump,
            products: searchResults,
            addItem: widget.addItem,
            itemView: widget.itemView,
            returnHome: widget.returnHome
          ),
        ),
      ],
    );
  }
}
