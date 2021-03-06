import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:nuborrow/cards/left_card.dart';
import 'package:nuborrow/cards/pick_mortgage_card.dart';
import 'package:page_transition/page_transition.dart';
import 'contact_detail_first_flow.dart';
import 'package:nuborrow/widgets/round_button.dart';
import '../utils/strings.dart';

class MortgageTerms extends StatefulWidget {
  static const MortgageTermsPageId = 'mortgage_terms';
  @override
  _MortgageTermsState createState() => _MortgageTermsState();
}

class _MortgageTermsState extends State<MortgageTerms> {
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
  List firstTabList = [
    'Fixed',
    'Variable',
  ];
  List secondTabList = [
    '3 Year',
    '5 Year',
  ];
  String firstSelectedValue;
  String secondSelectedValue;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Flexible(
      child: SingleChildScrollView(
        child: Wrap(
          children: [
            LeftSideCard(
              title: '''Pick the mortgage terms that work best for you''',
              topPadding: MediaQuery.of(context).size.height / 5,
              height: width > 800 ? height : height / 2,
              font: 45,
              showSubtitle: false,
              subtitle: '',
            ),
            Container(
              height: width > 800 ? height : height,
              width: width > 800 ? width / 2 : width,
              color: Color(0xfff7f9fc),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: width > 800 ? width / 2 : width,
                    child: Padding(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: Wrap(
                        direction: width > 1150 ? Axis.horizontal : width > 800 ? Axis.vertical : width >  650 ? Axis.horizontal : Axis.vertical ,
                        children: [
                          Container(
                            width: width > 1150 ? width / 5 : width > 650 ? width / 2.5 : width,
                            child: AutoSizeText(
                              'What type of mortgage would you like?',
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
                          SizedBox(height: 20, width: 50),
                          Container(
                            width: width > 1150 ? width / 5 : width > 800 ? width/2.5 :  width > 650 ? width/2.5  : width/1.1,
                            child: Wrap(
                              direction: Axis.vertical,
                              children: [
                                Wrap(
                                  direction: Axis.vertical,
                                  children: firstTabList == null ||
                                      firstTabList.length == 0
                                      ? [Container()]
                                      : firstTabList.map((element) {
                                    return Wrap(
                                      direction: Axis.vertical,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              firstSelectedValue = element;
                                            });
                                          },
                                          child: TabCard(
                                            title: element,
                                            labelColor:
                                            firstSelectedValue == element
                                                ? Color(0xff705aa7)
                                                : Colors.white,
                                            textColor:
                                            firstSelectedValue == element
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                        SizedBox(height: 15),
                                      ],
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: width > 800 ? width / 2 : width,
                    child: Padding(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: Wrap(
                        direction: width > 1150 ? Axis.horizontal : width > 800 ? Axis.vertical : width >  650 ? Axis.horizontal : Axis.vertical ,
                        children: [
                          Container(
                            width: width > 1150 ? width / 5 : width > 650 ? width / 2.5 : width,
                            child: AutoSizeText(
                              'Which mortgage term suits your Needs?',
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
                          SizedBox(height: 20, width: 50),
                          Container(
                            width: width > 1150 ? width / 5 : width > 800 ? width/2.5 :  width > 650 ? width/2.5  : width/1.1,
                            child: Wrap(
                              direction: Axis.vertical,
                              children: [
                                Wrap(
                                  direction: Axis.vertical,
                                  children: secondTabList == null ||
                                      secondTabList.length == 0
                                      ? [Container()]
                                      : secondTabList.map((element) {
                                    return Wrap(
                                      direction: Axis.vertical,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              secondSelectedValue = element;
                                            });
                                          },
                                          child: TabCard(
                                            title: element,
                                            labelColor:
                                            secondSelectedValue == element
                                                ? Color(0xff705aa7)
                                                : Colors.white,
                                            textColor:
                                            secondSelectedValue == element
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                        SizedBox(height: 15),
                                      ],
                                    );
                                  }).toList(),
                                ),
                                SizedBox(height: 50),
                                Container(
                                  width: width > 1150 ? width / 5 : width > 800 ? width/2.5 :  width > 650 ? width/2.5  : width/1.1,
                                  child: RoundedButton(
                                    title: 'continue',
                                    textColor: Colors.white,
                                    height: 60,
                                    colour: Color(0xff705aa7),
                                    buttonRadius: 10,
                                    onPressed: () {
                                      Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, duration: Duration(seconds: 1), child: ContactDetail()));
                                      // Navigator.pushNamed(context,
                                      //     ContactDetail.ContactDetailPageId);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
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


