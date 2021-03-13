import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nuborrow/utils/style.dart';
import 'contact_detail.dart';
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
            Container(
              height: width > 800 ? height : height / 2,
              width: width > 800 ? width / 2 : width,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 5,
                    left: 40,
                    right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Positioned(
                          child: SvgPicture.asset(
                            'assets/svg/triangle.svg',
                            width: 30,
                            height: 30,
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: AutoSizeText(
                              '''Pick the mortgage terms that work best for you''',
                              style: TextStyle(
                                  fontSize: 45,
                                  fontFamily: StringRefer.Poppins,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black),
                              softWrap: true,
                              maxLines: 3,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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
                        direction:
                        width > 800 ? Axis.horizontal : Axis.vertical,
                        spacing: width > 800 ? 40 : 40,
                        children: [
                          Container(
                            width:width > 800  ? width/5 : width,
                            child: Flexible(
                              child: AutoSizeText(
                                'Is this Property going to be?',
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
                          ),
                          Container(
                            width : width > 800  ? width/5 : width,
                            child: Expanded(
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
                        direction: width > 800 ? Axis.horizontal : Axis.vertical,
                        spacing: width > 800 ? 40 : 40,
                        children: [
                          Container(
                            width:width > 800  ? width/5 : width,
                            child: Flexible(
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
                          ),
                          Container(
                            width:width > 800  ? width/5 : width,
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
                                  width: width > 800 ? width / 5 : width / 2,
                                  child: RoundedButton(
                                    title: 'continue',
                                    textColor: Colors.white,
                                    colour: Color(0xff705aa7),
                                    buttonRadius: 10,
                                    onPressed: () {
                                      Navigator.pushNamed(context,
                                          ContactDetail.ContactDetailPageId);
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


class TabCard extends StatefulWidget {
  TabCard({this.title, this.labelColor, this.textColor});
  final String title;
  final Color textColor;
  final Color labelColor;
  @override
  _TabCardState createState() => _TabCardState();
}

class _TabCardState extends State<TabCard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Flexible(
      child: InkWell(
        child: Container(
          width: width > 800 ? width / 5 : width / 2,
          height: 50,
          decoration:
          StyleRefer.kTabDecoration.copyWith(color: widget.labelColor),
          child: Center(
            child: Text(
              widget.title,
              style: TextStyle(
                  fontFamily: StringRefer.Poppins, color: widget.textColor),
            ),
          ),
        ),
      ),
    );
  }
}
