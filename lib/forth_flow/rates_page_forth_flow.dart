import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nuborrow/cards/left_card.dart';
import 'package:nuborrow/forth_flow/complete_application_forth_flow.dart';
import 'package:page_transition/page_transition.dart';
import '../cards/rate_page_card.dart';

class RatesPageForthFlow extends StatefulWidget {
  static const RatesPageForthFlowId = 'rates4';
  @override
  _RatesPageForthFlowState createState() => _RatesPageForthFlowState();
}

class _RatesPageForthFlowState extends State<RatesPageForthFlow> {
  GlobalKey globalKey = new GlobalKey(debugLabel: 'btm_app_bar');
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
  }
  List<String> selectList = ['Fixed', 'Variable'];
  String selectedValue;
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
          color: Colors.white,
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
  List<String> selectRateList = ['Fixed', 'Variable'];
  String selectedRateValue;
  List<String> selectTermList = ['5 Year', '3 Year'];
  String selectedTermValue;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Flexible(
      child: SingleChildScrollView(
        child: Wrap(
          children: [
            LeftSideCard(
              showSubtitle: true,
              subtitle: '''Based on the information you’ve provided, here are the best rates on the market.''',
              title: '''Your best rates''',
              topPadding: MediaQuery.of(context).size.height / 5,
              height: width > 800 ? height : height / 2,
              font: 45,
              subtitleFont:25,
            ),
            Container(
              width: width > 800 ? width / 2 : width,
              color: Color(0xfff7f9fc),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  Container(
                    child: width > 1350 ?
                    DesktopRateCard(
                        cardWidth: width/7.5,
                        total: 1.74,
                        monthlyPayment: 20,
                        preApproval: 'Available',
                        prePayment: 20,
                        rateHold: 'Available',
                        onPressed: (){
                          navigate();
                        },
                    ):
                    width > 800 ? MobileViewRateCard(
                      cardWidth: width/7.5,
                      total: 1.74,
                      monthlyPayment: 20,
                      preApproval: 'Available',
                      prePayment: 20,
                      rateHold: 'Available',
                      onPressed: (){
                      },
                    ) : width > 650 ?
                    DesktopRateCard(
                      cardWidth: width/4,
                      total: 1.74,
                      monthlyPayment: 20,
                      preApproval: 'Available',
                      prePayment: 20,
                      rateHold: 'Available',
                      onPressed: (){
                        navigate();
                      },
                    ) : MobileViewRateCard(
                      cardWidth: width/4,
                      total: 1.74,
                      monthlyPayment: 20,
                      preApproval: 'Available',
                      prePayment: 20,
                      rateHold: 'Available',
                      onPressed: (){
                        navigate();
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: width > 1350 ?
                    DesktopRateCard(
                      cardWidth: width/7.5,
                      total: 1.79,
                      monthlyPayment: 20,
                      preApproval: 'Available',
                      prePayment: 20,
                      rateHold: 'Available',
                      onPressed: (){
                        navigate();
                      },
                    ):
                    width > 800 ? MobileViewRateCard(
                      cardWidth: width/7.5,
                      total: 1.79,
                      monthlyPayment: 20,
                      preApproval: 'Available',
                      prePayment: 20,
                      rateHold: 'Available',
                      onPressed: (){
                        navigate();
                      },
                    ) : width > 650 ?
                    DesktopRateCard(
                      cardWidth: width/4,
                      total: 1.79,
                      monthlyPayment: 20,
                      preApproval: 'Available',
                      prePayment: 20,
                      rateHold: 'Available',
                      onPressed: (){
                        navigate();
                      },
                    ) : MobileViewRateCard(
                      cardWidth: width/4,
                      total: 1.79,
                      monthlyPayment: 20,
                      preApproval: 'Available',
                      prePayment: 20,
                      rateHold: 'Available',
                      onPressed: (){
                        navigate();
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: width > 1350 ?
                    DesktopRateCard(
                      cardWidth: width/7.5,
                      total: 1.79,
                      monthlyPayment: 20,
                      preApproval: 'Available',
                      prePayment: 20,
                      rateHold: 'Available',
                      onPressed: (){
                        navigate();
                      },
                    ):
                    width > 800 ? MobileViewRateCard(
                      cardWidth: width/7.5,
                      total: 1.89,
                      monthlyPayment: 20,
                      preApproval: 'Available',
                      prePayment: 20,
                      rateHold: 'Available',
                      onPressed: (){
                        navigate();
                      },
                    ) : width > 650 ?
                    DesktopRateCard(
                      cardWidth: width/4,
                      total: 1.89,
                      monthlyPayment: 20,
                      preApproval: 'Available',
                      prePayment: 20,
                      rateHold: 'Available',
                      onPressed: (){
                        navigate();
                      },
                    ) : MobileViewRateCard(
                      cardWidth: width/4,
                      total: 1.89,
                      monthlyPayment: 20,
                      preApproval: 'Available',
                      prePayment: 20,
                      rateHold: 'Available',
                      onPressed: (){
                        navigate();
                      },
                    ),
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
  navigate(){
    Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, duration: Duration(seconds: 1), child: LastPageForthFlow()));
  }
}

