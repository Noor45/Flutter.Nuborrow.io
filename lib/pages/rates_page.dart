import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:nuborrow/cards/left_card.dart';
import 'package:nuborrow/pages/complete_application_page.dart';
import 'package:nuborrow/utils/colors.dart';
import 'package:nuborrow/widgets/input_fields.dart';
import '../cards/rate_page_card.dart';
import 'package:nuborrow/widgets/round_button.dart';
import '../utils/strings.dart';

class RatesPage extends StatefulWidget {
  static const RatesPageId = 'rates';
  @override
  _RatesPageState createState() => _RatesPageState();
}

class _RatesPageState extends State<RatesPage> {
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
                          Navigator.pushNamed(context, LastPage.LastPageId);
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
                        Navigator.pushNamed(context, LastPage.LastPageId);
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
                        Navigator.pushNamed(context, LastPage.LastPageId);
                      },
                    ) : MobileViewRateCard(
                      cardWidth: width/4,
                      total: 1.74,
                      monthlyPayment: 20,
                      preApproval: 'Available',
                      prePayment: 20,
                      rateHold: 'Available',
                      onPressed: (){
                        Navigator.pushNamed(context, LastPage.LastPageId);
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
                        Navigator.pushNamed(context, LastPage.LastPageId);
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
                        Navigator.pushNamed(context, LastPage.LastPageId);
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
                        Navigator.pushNamed(context, LastPage.LastPageId);
                      },
                    ) : MobileViewRateCard(
                      cardWidth: width/4,
                      total: 1.79,
                      monthlyPayment: 20,
                      preApproval: 'Available',
                      prePayment: 20,
                      rateHold: 'Available',
                      onPressed: (){
                        Navigator.pushNamed(context, LastPage.LastPageId);
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
                        Navigator.pushNamed(context, LastPage.LastPageId);
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
                        Navigator.pushNamed(context, LastPage.LastPageId);
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
                        Navigator.pushNamed(context, LastPage.LastPageId);
                      },
                    ) : MobileViewRateCard(
                      cardWidth: width/4,
                      total: 1.89,
                      monthlyPayment: 20,
                      preApproval: 'Available',
                      prePayment: 20,
                      rateHold: 'Available',
                      onPressed: (){
                        Navigator.pushNamed(context, LastPage.LastPageId);
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: width > 800 ? width / 2 : width,
                    child: Padding(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: Wrap(
                        direction: width > 800 ? Axis.horizontal :   width >  650 ? Axis.horizontal: Axis.vertical ,
                        spacing: width > 800 ? 50 : width >  650 ?  50 : 20 ,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                'Purchase Price',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: StringRefer.SegoeUI,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                softWrap: true,
                                maxLines: 3,
                                overflow: TextOverflow.visible,
                              ),
                              SizedBox(height: 14),
                              Container(
                                width: width > 1200 ? width / 5 : width > 800 ? width : width > 650 ? width/2.5 : width/1.1,
                                child: InputField(
                                  hintText: 'Enter here xxx',
                                  onChanged: (value) {},
                                  textInputType: TextInputType.text,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                'Amount of down payment',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: StringRefer.SegoeUI,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                softWrap: true,
                                maxLines: 3,
                                overflow: TextOverflow.visible,
                              ),
                              SizedBox(height: 14),
                              Container(
                                width: width > 1200 ? width / 5 : width > 800 ? width :  width > 650 ? width/2.5  : width/1.1,
                                child: InputField(
                                  hintText: 'Enter amount',
                                  onChanged: (value) {},
                                  textInputType: TextInputType.text,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: width > 800 ? width / 2 : width,
                    child: Padding(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: Wrap(
                        direction: width > 800 ? Axis.horizontal :   width >  650 ? Axis.horizontal: Axis.vertical ,
                        spacing: width > 800 ? 50 : width >  650 ?  50 : 20 ,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: width > 1200 ? width / 5 : width > 800 ? width : width > 650 ? width/2.5 : width/1.1,
                                child: AutoSizeText(
                                  'How much do you have as a down payment? ',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: StringRefer.SegoeUI,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                  softWrap: true,
                                  maxLines: 3,
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                              SizedBox(height: 14),
                              Container(
                                width: width > 1200 ? width / 5 : width > 800 ? width : width > 650 ? width/2.5 : width/1.1,
                                child: InputField(
                                  hintText: 'Enter a %',
                                  onChanged: (value) {},
                                  textInputType: TextInputType.text,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                'Rate Type',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: StringRefer.SegoeUI,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                softWrap: true,
                                maxLines: 3,
                                overflow: TextOverflow.visible,
                              ),
                              SizedBox(height: 14),
                              Container(
                                width: width > 1200 ? width / 5 : width > 800 ? width :  width > 650 ? width/2.5  : width/1.1,
                                child:   SelectField(
                                  hintText: 'Select Rate Type',
                                  value: selectedRateValue,
                                  selectionList: selectRateList,
                                  onChanged: (String newValue){
                                    setState(() {
                                      selectedRateValue = newValue;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: width > 800 ? width / 2 : width,
                    child: Padding(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: Wrap(
                        direction: width > 800 ? Axis.horizontal :   width >  650 ? Axis.horizontal: Axis.vertical ,
                        spacing: width > 800 ? 50 : width >  650 ?  50 : 20 ,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                'Term',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: StringRefer.SegoeUI,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                softWrap: true,
                                maxLines: 3,
                                overflow: TextOverflow.visible,
                              ),
                              SizedBox(height: 14),
                              Container(
                                width: width > 1200 ? width / 5 : width > 800 ? width :  width > 650 ? width/2.5  : width/1.1,
                                child:   SelectField(
                                  hintText: 'Select Terms',
                                  value: selectedTermValue,
                                  selectionList: selectTermList,
                                  onChanged: (String newValue){
                                    setState(() {
                                      selectedTermValue = newValue;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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
}

