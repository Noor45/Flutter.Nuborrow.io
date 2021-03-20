import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nuborrow/cards/contact_card.dart';
import 'package:nuborrow/cards/left_card.dart';
import 'package:nuborrow/first_flow/rates_page_first_flow.dart';
import 'package:page_transition/page_transition.dart';

import '../utils/strings.dart';
import '../widgets/input_fields.dart';
import '../widgets/round_button.dart';

class ContactDetail extends StatefulWidget {
  static const ContactDetailPageId = 'contact_detail';
  @override
  _ContactDetailState createState() => _ContactDetailState();
}

class _ContactDetailState extends State<ContactDetail> {
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
                  SizedBox(height: 20),
                  TextFieldCard(
                    label: 'Your best Contact Number',
                    hint: 'Enter your contact number',
                    textInputType: TextInputType.number,
                    onChanged: (value) {},
                    showButton: false,
                  ),
                  SizedBox(height: 20),
                  TextFieldCard(
                    label: 'Your email?',
                    hint: 'Enter your email',
                    textInputType: TextInputType.emailAddress,
                    onChanged: (value) {},
                    showButton: false,
                  ),
                  SizedBox(height: 30),
                  TextFieldCard(
                    label: 'Purchase Price',
                    hint: 'Enter xxx',
                    textInputType: TextInputType.number,
                    onChanged: (value) {},
                    showButton: false,
                  ),
                  SizedBox(height: 30),
                  TextFieldCard(
                    label: 'Amount of down payment',
                    hint: 'Enter xxx',
                    textInputType: TextInputType.number,
                    onChanged: (value) {},
                    showButton: false,
                  ),
                  SizedBox(height: 30),
                  TextFieldCard(
                    label: 'How much do you have as a down payment? ',
                    hint: 'Enter a %',
                    textInputType: TextInputType.number,
                    onChanged: (value) {},
                    showButton: false,
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: width > 900 ? width / 2 : width,
                    child: Padding(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: Wrap(
                        direction: width > 1100 ? Axis.horizontal :   width >  650 ? Axis.horizontal: Axis.vertical ,
                        children: [
                          Container(
                            width: width > 1100 ? width / 5 : width > 650 ? width / 2.5 : width,
                            child: LabelCard(
                              label:'Rate Type',
                            ),
                          ),
                          SizedBox(height: 20, width: 50),
                          Container(
                            width: width > 1100 ? width / 5 :  width > 650 ? width/2.5  : width/1.1,
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
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: width > 900 ? width / 2 : width,
                    child: Padding(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: Wrap(
                        direction: width > 1100 ? Axis.horizontal :   width >  650 ? Axis.horizontal: Axis.vertical ,
                        children: [
                          Container(
                            width: width > 1100 ? width / 5 : width > 650 ? width / 2.5 : width,
                            child: AutoSizeText(
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
                          ),
                          SizedBox(height: 20, width: 50),
                          Container(
                            width: width > 1100 ? width / 5 :  width > 650 ? width/2.5  : width/1.1,
                            child: Wrap(
                              direction: Axis.horizontal,
                              children: [
                                SelectField(
                                  hintText: 'Select Terms',
                                  value: selectedTermValue,
                                  selectionList: selectTermList,
                                  onChanged: (String newValue){
                                    setState(() {
                                      selectedTermValue = newValue;
                                    });
                                  },
                                ),
                                Wrap(
                                  direction: Axis.horizontal,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 50),
                                      child: Container(
                                        width: width > 1100 ? width / 5 :  width > 650 ? width/2.5  : width/1.1,
                                        child: RoundedButton(
                                          title: 'Yes, show me my rates  ',
                                          textColor: Colors.white,
                                          height: 60,
                                          colour: Color(0xff705aa7),
                                          buttonRadius: 10,
                                          onPressed: () {
                                            Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, duration: Duration(seconds: 1), child: RatesPageFirstFlow()));
                                            // Navigator.pushNamed(
                                            //     context, RatesPageFirstFlow.RatesPageFirstFlowId);
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
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


