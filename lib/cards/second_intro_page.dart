import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:nuborrow/first_flow/basic_detail_page.dart';
import 'package:nuborrow/widgets/round_button.dart';
import '../utils/constants.dart';
import '../utils/strings.dart';
import '../first_flow/basic_detail_page.dart';

class LeftCard extends StatefulWidget {
  LeftCard({this.firstSubtitle, this.firstTitle, this.onPressed1});
  final String firstTitle;
  final String firstSubtitle;
  final Function onPressed1;

  @override
  _LeftCardState createState() => _LeftCardState();
}

class _LeftCardState extends State<LeftCard> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: width > 700 ? height : height / 2,
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
<<<<<<< HEAD
                'I’ve Found a Property\n',
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: StringRefer.Poppins,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
=======
                widget.firstTitle,
                style: TextStyle(fontSize: 30, fontFamily: StringRefer.Poppins, fontWeight: FontWeight.w900, color: Colors.white),
>>>>>>> fcb961291a2381b707ae61ebc3c32e20c59d8f25
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
<<<<<<< HEAD
                'Show my today’s lowest rates\n',
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: StringRefer.SegoeUI,
                    color: Colors.white),
=======
                widget.firstSubtitle,
                style: TextStyle(fontSize: 18, fontFamily: StringRefer.SegoeUI, color: Colors.white),
>>>>>>> fcb961291a2381b707ae61ebc3c32e20c59d8f25
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
              width: MediaQuery.of(context).size.width / 5,
              child: RoundedButton(
                title: 'continue',
                height: 60,
                colour: Color(0xfffecf09),
                buttonRadius: 5,
<<<<<<< HEAD
                onPressed: () {
                  kNavigateNext(context: context, widget: BasicDetail());

                  // Navigator.pushNamed(context, BasicDetail.BasicDetailPageId);
                },
=======
                onPressed: widget.onPressed1,
>>>>>>> fcb961291a2381b707ae61ebc3c32e20c59d8f25
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RightCard extends StatefulWidget {
  RightCard({this.onPressed2, this.SecondSubtitle, this.SecondTitle});
  final String SecondTitle;
  final String SecondSubtitle;
  final Function onPressed2;
    @override
  _RightCardState createState() => _RightCardState();

}

class _RightCardState extends State<RightCard> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: width > 700 ? height : height / 2,
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
<<<<<<< HEAD
                'I’m still looking at homes or I’ve found a Property',
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: StringRefer.Poppins,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
=======
                widget.SecondTitle,
                style: TextStyle(fontSize: 30, fontFamily: StringRefer.Poppins, fontWeight: FontWeight.w900, color: Colors.white),
>>>>>>> fcb961291a2381b707ae61ebc3c32e20c59d8f25
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
<<<<<<< HEAD
                'Show me what the monthly payments and rates could be for my price range',
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: StringRefer.SegoeUI,
                    color: Colors.white),
=======
                  widget.SecondSubtitle,
                style: TextStyle(fontSize: 18, fontFamily: StringRefer.SegoeUI, color: Colors.white),
>>>>>>> fcb961291a2381b707ae61ebc3c32e20c59d8f25
                softWrap: true,
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.visible,
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width / 5,
            child: RoundedButton(
              title: 'continue',
              colour: Color(0xfffecf09),
              height: 60,
              buttonRadius: 5,
<<<<<<< HEAD
              onPressed: () {
                kNavigateNext(context: context, widget: BasicDetail());
                // Navigator.pushNamed(context, BasicDetail.BasicDetailPageId);
              },
=======
              onPressed: widget.onPressed2,
>>>>>>> fcb961291a2381b707ae61ebc3c32e20c59d8f25
            ),
          ),
        ],
      ),
    );
  }
}
