import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nuborrow/cards/contact_card.dart';
import 'package:nuborrow/cards/left_card.dart';
import 'package:nuborrow/second_flow/rates_page_second_flow.dart';
import 'package:page_transition/page_transition.dart';

class ContactDetail2ndFlow extends StatefulWidget {
  static const ContactDetail2ndFlowPageId = 'contact_detail2';
  @override
  _ContactDetail2ndFlowState createState() => _ContactDetail2ndFlowState();
}

class _ContactDetail2ndFlowState extends State<ContactDetail2ndFlow> {
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
          child: width > 800
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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Flexible(
      child: SingleChildScrollView(
        child: Wrap(
          children: [
            LeftSideCard(
              title:'''Good news, we’ve found some of the best rates on the market for you.''',
              topPadding: MediaQuery.of(context).size.height / 5,
              height: width > 900 ? height : height / 2,
              font: 40,
              showSubtitle: false,
              subtitle: '',
            ),
            Container(
              height: width > 900 ? height : height,
              width: width > 900 ? width / 2 : width,
              color: Color(0xfff7f9fc),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFieldCard(
                    label: 'What’s you name?',
                    hint: 'Enter your name',
                    textInputType: TextInputType.text,
                    onChanged: (value) {},
                    showButton: false,
                  ),
                  SizedBox(height: 30),
                  TextFieldCard(
                    label: 'Your best contact number?',
                    hint: 'Enter your contact number',
                    textInputType: TextInputType.number,
                    onChanged: (value) {},
                    showButton: false,
                  ),
                  SizedBox(height: 30),
                  TextFieldCard(
                    label: 'Your email?',
                    hint: 'Enter your email',
                    textInputType: TextInputType.emailAddress,
                    onChanged: (value) {},
                    showButton: true,
                    onPressed: () {
                      Navigator.push(context, PageTransition(
                          type: PageTransitionType.rightToLeft,
                          duration: Duration(seconds: 1),
                          child: RatesPage2ndFlow())
                      );
                    },
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


