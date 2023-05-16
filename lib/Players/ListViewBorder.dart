import 'package:flutter/cupertino.dart';

import '../Colors/colors.dart';

class ListViewBorder extends StatefulWidget {
  ListViewBorder({super.key});
  @override
  _ListViewBorder createState() => _ListViewBorder();
}

class _ListViewBorder extends State<ListViewBorder> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 350,
        height: 230,
        decoration:  BoxDecoration(
            color: commonBackground,
            borderRadius: BorderRadius.circular(30)),
    );
  }

}