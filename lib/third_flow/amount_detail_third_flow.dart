import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:nuborrow/cards/amount_page_card.dart';
import 'package:nuborrow/cards/left_card.dart';
import 'package:nuborrow/third_flow/contact_detail_third_flow.dart';
import 'package:nuborrow/utils/colors.dart';
import 'package:page_transition/page_transition.dart';
import '../utils/strings.dart';

class AmountDetail3rdFlow extends StatefulWidget {
  static const AmountDetail3rdFlowPageId = 'amount_detail3';
  @override
  _AmountDetail3rdFlowState createState() => _AmountDetail3rdFlowState();
}

class _AmountDetail3rdFlowState extends State<AmountDetail3rdFlow> {
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
                  SizedBox(height: 50),
                  TextFieldCard(
                    label: 'What is the current value of your home?',
                    hint: 'Enter amount',
                    textInputType: TextInputType.number,
                    showButton: false,
                    onChanged: (value) {},
                  ),
                  SizedBox(height: 20),
                  TextFieldCard(
                    label: 'What is your current mortgage balance?',
                    hint: 'Enter amount',
                    textInputType: TextInputType.number,
                    showButton: false,
                    onChanged: (value) {},
                  ),
                  SizedBox(height: 20),
                  AmountCard(),
                  SizedBox(height: 20),
                  TextFieldCard(
                    label: 'When would you like the funding?  ',
                    hint: 'xxx',
                    textInputType: TextInputType.text,
                    onChanged: (value) {},
                    showButton: true,
                    onPressed: (){
                      Navigator.push(context, PageTransition(
                          type: PageTransitionType.rightToLeft,
                          duration: Duration(seconds: 1),
                          child: ContactDetail3rdFlow())
                      );
                    },
                  ),
                  SizedBox(height: 70),
                ],
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
