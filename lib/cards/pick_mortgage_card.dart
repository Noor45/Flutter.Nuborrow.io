import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nuborrow/utils/style.dart';
import '../utils/strings.dart';


class TabCard extends StatefulWidget {
  TabCard({this.title, this.labelColor, this.textColor});
  final String title;
  final Color textColor;
  final Color labelColor;
  @override
  _TabCardState createState() => _TabCardState();
}

class _TabCardState extends State<TabCard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      child: Container(
        width: width > 1150 ? width / 5 : width > 800 ? width/2.5 :  width > 650 ? width/2.5  : width/1.1,
        height: 50,
        decoration:
        StyleRefer.kTabDecoration.copyWith(color: widget.labelColor),
        child: Center(
          child: Text(
            widget.title,
            style: TextStyle(
                fontFamily: StringRefer.Poppins, color: widget.textColor),
          ),
        ),
      ),
    );
  }
}
