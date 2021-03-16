import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/strings.dart';

class LabelCard extends StatefulWidget {
  LabelCard({this.icon, this.label});
  final String icon;
  final String label;
  @override
  _LabelCardState createState() => _LabelCardState();
}

class _LabelCardState extends State<LabelCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Color(0xfff7f9fc),
          radius: 40,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 30,
            child: Container(
              child: SvgPicture.asset(
                widget.icon,
                width: 40,
                height: 40,
              ),
            ),
          ),
        ),
        SizedBox(width: 20),
        Flexible(
          child: AutoSizeText(
            widget.label,
            style:
            TextStyle(fontSize: 18, fontFamily: StringRefer.PoppinMedium),
            softWrap: true,
            maxLines: 3,
            overflow: TextOverflow.visible,
          ),
        )
      ],
    );
  }
}