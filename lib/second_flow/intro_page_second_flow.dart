import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:nuborrow/cards/left_card.dart';
import 'package:nuborrow/first_flow/second_intro_first_flow.dart';
import 'package:nuborrow/second_flow/second_intro_second_flow.dart';
import 'package:nuborrow/widgets/round_button.dart';
import 'package:page_transition/page_transition.dart';
import '../cards/intro_page_card.dart';
import '../utils/strings.dart';

class IntroPage2ndFlow extends StatefulWidget {
  static const IntroPageId2ndFlow = 'continue2';
  @override
  _IntroPage2ndFlowState createState() => _IntroPage2ndFlowState();
}

class _IntroPage2ndFlowState extends State<IntroPage2ndFlow> {
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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Flexible(
      child: SingleChildScrollView(
        child: Wrap(
          children: [
            Container(
              height: width > 700 ? height : height/1.5,
              width: width > 700 ? width / 2 : width,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: width > 700 ? width / 3 : width / 1.3,
                    child: LabelCard(
                      icon: 'assets/svg/home.svg',
                      label: 'Buying a home',
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: width > 700 ? width / 3 : width / 1.3,
                    child: LabelCard(
                      icon: 'assets/svg/refinancing.svg',
                      label: 'Refinancing my home',
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: width > 700 ? width / 3 : width / 1.3,
                    child: LabelCard(
                      icon: 'assets/svg/credit.svg',
                      label: 'Adding a Line of Credit',
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: width > 700 ? width / 3 : width / 1.3,
                    child: LabelCard(
                      icon: 'assets/svg/wallet.svg',
                      label: 'Adding a Home Equity Loan',
                    ),
                  ),
                ],
              ),
            ),

            Container(
              height: width > 700 ? height : height/2,
              width: width > 700 ? width / 2 : width,
              color: Color(0xff2e184f),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: AutoSizeText(
                      'I’m need to refinance / renew',
                      style: TextStyle(fontSize: 28, fontFamily: StringRefer.Poppins, fontWeight: FontWeight.bold, color: Colors.white),
                      softWrap: true,
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  SizedBox(height: 20),
                  Flexible(
                    child: Padding(
                      padding:  EdgeInsets.only(left: width/12, right: width/12),
                      child: AutoSizeText(
                        'I want to look at refinancing my Existing mortgage vs renewing my current mortgage',
                        style: TextStyle(fontSize: 18, fontFamily: StringRefer.SegoeUI, color: Colors.white),
                        softWrap: true,
                        maxLines: 3,
                        textAlign: TextAlign.center,
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
                      buttonRadius: 5,
                      height: 60,
                      onPressed: (){
                        Navigator.pushAndRemoveUntil(context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                duration: Duration(seconds: 1),
                                child: NextIntroPage2ndFlow()
                            ), (route) => false);
                        // Navigator.push(context, PageTransition(
                        //     type: PageTransitionType.rightToLeft,
                        //     duration: Duration(seconds: 1),
                        //     child: NextIntroPage2ndFlow())
                        // );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

