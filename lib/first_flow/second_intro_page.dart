import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nuborrow/cards/second_intro_card.dart';
import 'package:nuborrow/first_flow/basic_detail_page.dart';
import 'package:page_transition/page_transition.dart';

class NextIntroPageFirstFlow extends StatefulWidget {
  static const SecondIntroPageFirstFlowId = 'intro';
  @override
  _NextIntroPageFirstFlowState createState() => _NextIntroPageFirstFlowState();
}

class _NextIntroPageFirstFlowState extends State<NextIntroPageFirstFlow> {
  GlobalKey globalKey = new GlobalKey(debugLabel: 'btm_app_bar');
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          margin: EdgeInsets.only(top: width > 1100 ? 50 : 0, bottom: width > 1100 ? 50 : 0),
          child: width > 700
              ? Row(
            children: [
              ViewContent(),
            ],
          )
              : Column(
            children: [
              ViewContent(),
            ],
          ),
        ),
      ),
    );
  }
}

class ViewContent extends StatefulWidget {
  @override
  _ViewContentState createState() => _ViewContentState();
}

class _ViewContentState extends State<ViewContent> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SingleChildScrollView(
        child: Wrap(
          children: [
            LeftCard(
              firstTitle: 'I’ve Found a Property',
              firstSubtitle: 'Show my today’s lowest rates',
              onPressed1: (){
                Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, duration: Duration(seconds: 1), child: BasicDetailFirstFlow()));
              },
            ),
            RightCard(
              SecondTitle: 'I’m still looking at homes or I’ve found a Property',
              SecondSubtitle:'Show me what the monthly payments and rates could be for my price range',
              onPressed2: (){
                // Navigator.pushNamed(context, BasicDetailFirstFlow.BasicDetailPageFirstFlowId);
                Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, duration: Duration(seconds: 1), child: BasicDetailFirstFlow()));
              },
            )
          ],
        ),
      ),
    );
  }
}


