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
      body: const Column(),
    );
  }
}
