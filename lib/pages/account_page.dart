import 'package:flutter/material.dart';
import 'package:demo/constants.dart';
import 'package:demo/pages/components/app_bar.dart';


class AccountPage extends StatefulWidget {
  final PageCallBack pageJump;
  const AccountPage({Key? key, required this.pageJump}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountState();
}

class _AccountState extends State<AccountPage> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: buildAppBar(widget.pageJump, 1),
      body: ListView(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
            child: ListTile(
              leading: Icon(
                Icons.account_circle_rounded,
                size: 45.0,
                color: kTextLight,
              ),
              title: Text(
                'Account',
                style: TextStyle(
                  color: kTextLight,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Container(
            color: kTextOverlay,
            height: 2.0,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding / 2
            ),
            child: ListTile(
              leading: Icon(
                Icons.favorite_rounded,
                color: kTextLight,
              ),
              title: Text(
                'Watchlist',
                style: TextStyle(
                  color: kTextLight,
                  fontSize: 14.0,
                ),
              ),
            ),
          ),
          Container(
            color: kTextOverlay,
            height: 2.0,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding / 2
            ),
            child: ListTile(
              leading: Icon(
                Icons.wallet,
                color: kTextLight,
              ),
              title: Text(
                'Payments',
                style: TextStyle(
                  color: kTextLight,
                  fontSize: 14.0,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding / 2
            ),
            child: ListTile(
              leading: Icon(
                Icons.settings,
                color: kTextLight,
              ),
              title: Text(
                'Settings',
                style: TextStyle(
                  color: kTextLight,
                  fontSize: 14.0,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding / 2
            ),
            child: ListTile(
              leading: Icon(
                Icons.help,
                color: kTextLight,
              ),
              title: Text(
                'Help',
                style: TextStyle(
                  color: kTextLight,
                  fontSize: 14.0,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding / 2
            ),
            child: ListTile(
              leading: Icon(
                Icons.logout,
                color: kTextLight,
              ),
              title: Text(
                'Logout',
                style: TextStyle(
                  color: kTextLight,
                  fontSize: 14.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
