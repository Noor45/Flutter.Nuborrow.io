import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nuborrow/cards/second_intro_card.dart';
import 'package:nuborrow/second_flow/basic_detail_second_flow.dart';
import 'package:page_transition/page_transition.dart';

class NextIntroPage2ndFlow extends StatefulWidget {
  static const SecondIntroPage2ndFlowId = 'intro2';
  @override
  _NextIntroPage2ndFlowState createState() => _NextIntroPage2ndFlowState();
}

class _NextIntroPage2ndFlowState extends State<NextIntroPage2ndFlow> {
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
          margin: EdgeInsets.only(
              top: width > 1100 ? 50 : 0, bottom: width > 1100 ? 50 : 0),
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
              firstTitle: 'I want to refinance my mortgage',
              firstSubtitle: 'Need to refinance your mortgage? Did you know you can refinance at a lower rate and access equity to pay off higher interest debt?',
              onPressed1: () {
                Navigator.push(context, PageTransition(
                    type: PageTransitionType.rightToLeft,
                    duration: Duration(seconds: 1),
                    child: BasicDetail2ndFlow())
                );
              },
            ),
            RightCard(
              SecondTitle: 'My mortgage is coming up for renewal',
              SecondSubtitle:'Why settle for just one rate, from one bank when you may qualify for a lower rate?',
              onPressed2: (){
                Navigator.push(context, PageTransition(
                    type: PageTransitionType.rightToLeft,
                    duration: Duration(seconds: 1),
                    child: BasicDetail2ndFlow())
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
