import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:nuborrow/cards/contact_card.dart';
import 'package:nuborrow/cards/left_card.dart';
import 'package:nuborrow/second_flow/rates_page_second_flow.dart';
import 'package:nuborrow/utils/constants.dart';
import 'package:nuborrow/utils/strings.dart';
import 'package:page_transition/page_transition.dart';
import 'package:simple_tooltip/simple_tooltip.dart';

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
  var maskFormatter = new MaskTextInputFormatter(mask: '###-###-####', filter: { "#": RegExp(r'[0-9]') });
  String message = '';
  bool show = false;
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
                    onChanged: (value) {
                      ConstantValueSecond.name = value;
                    },
                    showButton: false,
                  ),
                  SizedBox(height: 30),
                  TextFieldCard(
                    label: 'Your best contact number?',
                    hint: 'Enter your contact number',
                    textInputType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      maskFormatter
                    ],
                    onChanged: (value) {
                      ConstantValueSecond.number = value;
                    },
                    showButton: false,
                  ),
                  SizedBox(height: 30),
                  SimpleTooltip(
                    ballonPadding: EdgeInsets.all(3),
                    arrowTipDistance: 3,
                    backgroundColor: Colors.black54,
                    borderColor: Colors.black26,
                    animationDuration: Duration(seconds: 1),
                    show: show,
                    tooltipDirection: width > 1350
                        ? TooltipDirection.left
                        : width > 800
                        ? TooltipDirection.up
                        : width > 650
                        ? TooltipDirection.left
                        : TooltipDirection.up,
                    child: TextFieldCard(
                      label: 'Your email?',
                      hint: 'Enter your email',
                      textInputType: TextInputType.emailAddress,
                      onChanged: (value) {
                        ConstantValueSecond.email = value;
                      },
                      showButton: true,
                      onPressed: () {
                        setState(() {
                          if(ConstantValueSecond.name == ''){
                            message = 'Enter your Name';
                            show = true;
                            hideToolTip();
                          }else if(ConstantValueSecond.number == ''){
                            message = 'Enter your Number';
                            show = true;
                            hideToolTip();
                          }else if(ConstantValueSecond.email == ''){
                            message = 'Enter your Email';
                            show = true;
                            hideToolTip();
                          }else{
                            Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, duration: Duration(seconds: 1), child: RatesPage2ndFlow()));
                          }
                        });
                      },
                    ),
                    content: Text(
                      message,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          decoration: TextDecoration.none,
                          fontFamily: StringRefer.SFProText
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
  hideToolTip()async{
    await Future.delayed(Duration(seconds: 3) , () async {
      setState(() {
        show = false;
      });
    });
  }
}


