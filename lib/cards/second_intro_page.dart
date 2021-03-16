import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:nuborrow/pages/basic_detail_page.dart';
import 'package:nuborrow/widgets/round_button.dart';
import '../utils/strings.dart';
import '../pages/basic_detail_page.dart';


class LeftCard extends StatefulWidget {
  @override
  _LeftCardState createState() => _LeftCardState();
}

class _LeftCardState extends State<LeftCard> {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: width > 700 ? height : height/2,
      width: width > 700 ? width / 2 : width,
      color: Color(0xff705aa7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(left: 90, right: 90),
              child: AutoSizeText(
                'I’ve Found a Property',
                style: TextStyle(fontSize: 30, fontFamily: StringRefer.Poppins, fontWeight: FontWeight.w900, color: Colors.white),
                softWrap: true,
                maxLines: 3,
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
              ),
            ),
          ),
          SizedBox(height: 20),
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(left: 120, right: 120),
              child: AutoSizeText(
                'Show my today’s lowest rates',
                style: TextStyle(fontSize: 18, fontFamily: StringRefer.SegoeUI, color: Colors.white),
                softWrap: true,
                maxLines: 3,
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: Container(
              width: MediaQuery.of(context).size.width/5,
              child: RoundedButton(
                title: 'continue',
                height: 60,
                colour: Color(0xfffecf09),
                buttonRadius: 5,
                onPressed: (){
                  Navigator.pushNamed(context, BasicDetail.BasicDetailPageId);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RightCard extends StatefulWidget {
  @override
  _RightCardState createState() => _RightCardState();
}

class _RightCardState extends State<RightCard> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: width > 700 ? height : height/2,
      width: width > 700 ? width / 2 : width,
      color: Color(0xff2e184f),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(left: 90, right: 90),
              child: AutoSizeText(
                'I’m still looking at homes or I’ve found a Property',
                style: TextStyle(fontSize: 30, fontFamily: StringRefer.Poppins, fontWeight: FontWeight.w900, color: Colors.white),
                softWrap: true,
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.visible,
              ),
            ),
          ),
          SizedBox(height: 20),
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(left: 120, right: 120),
              child: AutoSizeText(
                'Show me what the monthly payments and rates could be for my price range',
                style: TextStyle(fontSize: 18, fontFamily: StringRefer.SegoeUI, color: Colors.white),
                softWrap: true,
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.visible,
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width/5,
            child: RoundedButton(
              title: 'continue',
              colour: Color(0xfffecf09),
              height: 60,
              buttonRadius: 5,
              onPressed: (){
                Navigator.pushNamed(context, BasicDetail.BasicDetailPageId);
              },
            ),
          ),
        ],
      ),
    );
  }
}