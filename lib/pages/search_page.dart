import 'package:flutter/material.dart';
import 'package:demo/constants.dart';
import 'package:demo/models/product.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchState();
}

class _SearchState extends State<SearchPage> with AutomaticKeepAliveClientMixin {

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
          padding: const EdgeInsets.all(kDefaultPadding),
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
          child: ListView.builder(
            itemCount: searchResults.length,
            itemBuilder: (BuildContext context, int index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
                child: Card(
                color: kLightBackgroundColor,
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
                  leading: SizedBox(
                    height: 40,
                    width: 40,
                    child: Image.asset(
                      searchResults[index].image,
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  title: Text(
                    searchResults[index].title,
                    style: const TextStyle(
                      color: kTextDark,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "\$${searchResults[index].price}",
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
