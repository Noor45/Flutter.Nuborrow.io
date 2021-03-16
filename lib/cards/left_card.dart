import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/strings.dart';

class LeftSideCard extends StatefulWidget {
  LeftSideCard(
      {this.title,
      this.font,
      this.height,
      this.topPadding,
      this.subtitle,
      this.subtitleFont,
      this.showSubtitle});
  final String title;
  final double font;
  final double subtitleFont;
  final String subtitle;
  final double height;
  final double topPadding;
  final bool showSubtitle;
  @override
  _LeftSideCardState createState() => _LeftSideCardState();
}

class _LeftSideCardState extends State<LeftSideCard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: widget.height,
      width: width > 800 ? width / 2 : width,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(top: widget.topPadding, left: 40, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Positioned(
                  child: SvgPicture.asset(
                    'assets/svg/triangle.svg',
                    width: 30,
                    height: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: AutoSizeText(
                    widget.title,
                    style: TextStyle(
                        fontSize: widget.font,
                        fontFamily: StringRefer.Poppins,
                        fontWeight: FontWeight.w900,
                        color: Colors.black),
                    softWrap: true,
                    maxLines: 3,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ],
            ),
            Visibility(
              visible: widget.showSubtitle,
              child: Padding(
                padding: EdgeInsets.only(right: 40),
                child: AutoSizeText(
                  widget.subtitle,
                  style: TextStyle(
                      fontSize: widget.subtitleFont,
                      fontFamily: StringRefer.PoppinMedium,
                      fontWeight: FontWeight.w900,
                      color: Colors.black),
                  softWrap: true,
                  maxLines: 3,
                  overflow: TextOverflow.visible,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
