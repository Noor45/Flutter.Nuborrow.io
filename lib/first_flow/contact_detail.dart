import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nuborrow/cards/left_card.dart';
import 'package:nuborrow/first_flow/amount_detail.dart';
import 'package:nuborrow/first_flow/pick_mortgage_term.dart';
import 'package:nuborrow/first_flow/rates_page.dart';
import 'package:nuborrow/first_flow/second_intro_page.dart';
import 'package:nuborrow/widgets/input_fields.dart';
import 'package:nuborrow/widgets/round_button.dart';
import 'package:page_transition/page_transition.dart';
import '../utils/strings.dart';

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

class LabelCard extends StatelessWidget {
  LabelCard({this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      label,
      style: TextStyle(
          fontSize: 18,
          fontFamily: StringRefer.SegoeUI,
          fontWeight: FontWeight.bold,
          color: Colors.black),
      softWrap: true,
      maxLines: 3,
      overflow: TextOverflow.visible,
    );
  }
}

class TextFieldCard extends StatefulWidget {
  TextFieldCard(
      {this.textInputType,
      this.label,
      this.hint,
      this.onChanged,
      this.showButton});
  final String label;
  final String hint;
  final Function onChanged;
  final TextInputType textInputType;
  final bool showButton;
  @override
  _TextFieldCardState createState() => _TextFieldCardState();
}

class _TextFieldCardState extends State<TextFieldCard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width > 900 ? width / 2 : width,
      child: Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Wrap(
          direction: width > 900 ? Axis.horizontal : Axis.vertical,
          spacing: width > 900 ? 40 : 40,
          children: [
            Container(
              width: width > 800 ? width / 5 : width,
              child: LabelCard(
                label: widget.label,
              ),
            ),
            Container(
              width: width > 800 ? width / 5 : width / 2,
              child: Wrap(
                direction: Axis.horizontal,
                children: [
                  InputField(
                    hintText: widget.hint,
                    onChanged: widget.onChanged,
                    textInputType: widget.textInputType,
                  ),
                  Visibility(
                    visible: widget.showButton,
                    child: Wrap(
                      direction: Axis.horizontal,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Container(
                            width: width > 800 ? width / 5 : width / 2,
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
