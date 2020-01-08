import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      title: Text("首页")
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

