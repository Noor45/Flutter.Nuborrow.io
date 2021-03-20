import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:nuborrow/cards/amount_page_card.dart';
import 'package:nuborrow/cards/left_card.dart';
import 'package:intl/intl.dart';
import 'package:nuborrow/second_flow/pick_mortgage_term_second_flow.dart';
import 'package:nuborrow/utils/colors.dart';
import 'package:nuborrow/utils/constants.dart';
import 'package:page_transition/page_transition.dart';
import '../utils/strings.dart';

class AmountDetail2ndFlow extends StatefulWidget {
  static const AmountDetail2ndFlowPageId = 'amount_detail2';
  @override
  _AmountDetail2ndFlowState createState() => _AmountDetail2ndFlowState();
}

class _AmountDetail2ndFlowState extends State<AmountDetail2ndFlow> {
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
  TextEditingController dateController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Flexible(
      child: SingleChildScrollView(
        child: Wrap(
          children: [
            LeftSideCard(
              title: 'Let’s talk about how we can help you the Best',
              showSubtitle: false,
              subtitle: '',
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
                    showButton: false,
                    label: 'What is the current value of your home?',
                    hint: 'Enter amount',
                    textInputType: TextInputType.number,
                    onChanged: (value) {},
                  ),
                  SizedBox(height: 20),
                  TextFieldCard(
                    showButton: false,
                    label: 'What is your current mortgage balance?',
                    hint: 'Enter amount',
                    textInputType: TextInputType.number,
                    onChanged: (value) {},
                  ),
                  SizedBox(height: 20),
                  AmountCard(),
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
                              '''Do you want to borrow any Extra funds?''',
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
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFieldCard(
                    showButton: false,
                    label: 'Up to a maximum of [\$amount] fromAbove',
                    hint: '\$560060',
                    textInputType: TextInputType.number,
                    onChanged: (value) {},
                  ),
                  SizedBox(height: 20),
                  MortgageCard(),
                  SizedBox(height: 20),
                  DateTimeFieldCard(
                    label: 'When would you like to complete Your refinance?',
                    hint: 'Enter Date',
                    onTab: () async {
                      var date = await Constants.showDate(context);
                      setState(() {
                        dateController.text =
                            DateFormat('yyyy-MM-dd').format(date);
                      });
                    },
                    showButton: true,
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              duration: Duration(seconds: 1),
                              child: MortgageTerms2ndFlow()));
                    },
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

        // height: MediaQuery.of(context).size.height/3,
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
                      'Determining your required mortgage amount',
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
                    title: 'Current mortgage',
                    value: '\$20000',
                    color: Colors.black,
                  ),
                  SizedBox(height: 10),
                  PriceCard(
                    title: '+ Additional equity ',
                    value: '\$29300',
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
                title: '= Total mortgage requested',
                value: '\$125000',
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AmountCard extends StatefulWidget {
  @override
  _AmountCardState createState() => _AmountCardState();
}

class _AmountCardState extends State<AmountCard> {
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
                      'Your complete home equity picture',
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
                    title: 'current home value',
                    value: '\$12000',
                    color: Colors.black,
                  ),
                  SizedBox(height: 10),
                  PriceCard(
                    title: '* 80 %',
                    value: '\$120009',
                    color: Colors.black,
                  ),
                  SizedBox(height: 10),
                  PriceCard(
                    title: '= Max. Loan amount',
                    value: '\$12660000',
                    color: Colors.black,
                  ),
                  SizedBox(height: 10),
                  PriceCard(
                    title: '- current mortgage balance',
                    value: '\$12660000',
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
                title:
                    '= Did you know you could borrow an additional [\$amount]',
                value: '\$12660000',
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
