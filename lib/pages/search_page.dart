import 'package:flutter/material.dart';
import 'package:demo/constants.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchState();
}

class _SearchState extends State<SearchPage> with AutomaticKeepAliveClientMixin {

  bool doKeepAlive = false;
  String search = "";
  late FocusNode focus;

  @override
  void initState() {
    super.initState();
    focus = FocusNode();
  }

  @override
  void dispose() {
    focus.dispose();
    super.dispose();
  }

  void focusTextField() {
    search == "" ? focus.requestFocus : null;
  }

  @override
  bool get wantKeepAlive => doKeepAlive;

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                            });
                          },
                          focusNode: focus,
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
      ],
    );
  }
}
