import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:nuborrow/cards/amount_page_card.dart';
import 'package:nuborrow/cards/left_card.dart';
import 'package:nuborrow/first_flow/pick_mortgage_term_first_flow.dart';
import 'package:nuborrow/utils/colors.dart';
import 'package:nuborrow/widgets/round_button.dart';
import 'package:page_transition/page_transition.dart';
import '../utils/constants.dart';
import '../utils/strings.dart';

class AmountDetailFirstFlow extends StatefulWidget {
  static const AmountDetailPageFirstFlowId = 'amount_detail';

  @override
  _AmountDetailFirstFlowState createState() => _AmountDetailFirstFlowState();
}

class _AmountDetailFirstFlowState extends State<AmountDetailFirstFlow> {
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
          color: Colors.white,
          margin: EdgeInsets.only(
              top: width > 1100 ? 50 : 0, bottom: width > 1100 ? 50 : 0),
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
    'Yes',
    'No',
  ];
  String firstSelectedValue;
  String price = "50";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Flexible(
      child: SingleChildScrollView(
        child: Wrap(
          children: [
            LeftSideCard(
              showSubtitle: false,
              subtitle: '',
              title: '''Let’s talk about your needs ''',
              topPadding: MediaQuery.of(context).size.height / 5,
              height: width > 900 ? height : height / 2,
              font: 40,
            ),
            Container(
              width: width > 900 ? width / 2 : width,
              color: Color(0xfff7f9fc),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  TextFieldCard(
                    label: 'What is the price of your new home?',
                    hint: 'Enter amount',
                    textInputType: TextInputType.number,
                    value: price,
                    showButton: false,
                    onChanged: (value) {
                      setState(() {
                        price = moneyFormat(value);
                        print(price);
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  TextFieldCard(
                    label:
                        'How much do you have as a Down payment? (enter a %)',
                    hint: 'Enter amount',
                    showButton: false,
                    textInputType: TextInputType.number,
                    onChanged: (value) {},
                  ),
                  SizedBox(height: 30),
                  MortgageCard(),
                  SizedBox(height: 30),
                  DateTimeFieldCard(
                    label: 'When do you want to move in?',
                    hint: 'Enter Date',
                    onChanged: (value) {},
                    showButton: false,
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: width > 900 ? width / 2 : width,
                    child: Padding(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: Wrap(
                        direction: width > 1100
                            ? Axis.horizontal
                            : width > 650
                            ? Axis.horizontal
                            : Axis.vertical,
                        children: [
                          Container(
                            width: width > 1100
                                ? width / 5
                                : width > 650
                                ? width / 2.5
                                : width,
                            child: AutoSizeText(
                              '''Will you be a first-time home buyer?''',
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
                          SizedBox(
                            height: 20,
                            width: 50,
                          ),
                          Wrap(
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
                                          firstSelectedValue ==
                                              element
                                              ? Color(0xff705aa7)
                                              : Colors.white,
                                          textColor: firstSelectedValue ==
                                              element
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 15),
                                    ],
                                  );
                                }).toList(),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 40),
                                child: Container(
                                  width: width > 1100 ? width / 5 :  width > 650 ? width/2.5  : width/1.1,
                                  child: RoundedButton(
                                    title: 'continue',
                                    textColor: Colors.white,
                                    colour: Color(0xff705aa7),
                                    buttonRadius: 10,
                                    height: 60,
                                    onPressed: () {
                                      Navigator.push(context, PageTransition(
                                          type: PageTransitionType.rightToLeft,
                                          duration: Duration(seconds: 1),
                                          child: MortgageTerms())
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MortgageCard extends StatefulWidget {
  @override
  _MortgageCardState createState() => _MortgageCardState();
}

class _MortgageCardState extends State<MortgageCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(color: ColorRefer.kBorderColor, width: 1.0),
            right: BorderSide(color: ColorRefer.kBorderColor, width: 1.0),
            top: BorderSide(color: ColorRefer.kBorderColor, width: 1.0),
            bottom: BorderSide(color: ColorRefer.kBorderColor, width: 1.0),
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: 20),
                Container(
                  child: Center(
                    child: AutoSizeText(
                      'Calculating your Mortgage needs',
                      style: TextStyle(
                          fontFamily: StringRefer.SegoeUI, fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Divider(color: ColorRefer.kBorderColor),
              ],
            ),
            Center(
              child: Column(
                children: [
                  PriceCard(
                    title: 'Purchased Price',
                    value: '\$0',
                    color: Colors.black,
                  ),
                  SizedBox(height: 10),
                  PriceCard(
                    title: '- Purchased Price',
                    value: '\$0',
                    color: Colors.black,
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xff9484be),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0)),
              ),
              child: PriceCard(
                title: '= Total mortgage required',
                value: '\$0',
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}












