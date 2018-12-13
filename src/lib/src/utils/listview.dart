import 'package:flutter/material.dart';

class AppListView extends StatefulWidget {
  final List<String> items = new List<String>();

  void updateItems(String item) {
    items.add(item);
  }

  @override
  _AppListViewState createState() => new _AppListViewState();
}

class _AppListViewState extends State<AppListView> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.items.length.toString());
  }
}
