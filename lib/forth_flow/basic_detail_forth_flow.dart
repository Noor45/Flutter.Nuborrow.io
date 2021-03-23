import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:nuborrow/cards/left_card.dart';
import 'package:nuborrow/forth_flow/amount_detail_forth_flow.dart';
import 'package:nuborrow/utils/style.dart';
import 'package:nuborrow/widgets/input_fields.dart';
import 'package:nuborrow/widgets/round_button.dart';
import 'package:page_transition/page_transition.dart';
import '../utils/strings.dart';

class BasicDetailForthFlow extends StatefulWidget {
  static const BasicDetailPageForthFlowId = 'basic_detail4';
  @override
  _BasicDetailForthFlowState createState() => _BasicDetailForthFlowState();
}

class _BasicDetailForthFlowState extends State<BasicDetailForthFlow> {
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
          margin: EdgeInsets.only(
              top: width > 1100 ? 50 : 0, bottom: width > 1100 ? 50 : 0),
          child: width > 800
              ? Row(
                  children: [
                    ViewContent(),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
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
  List tabList = [
    'Owner occupied',
    'Owner occupied with rental income',
    'Rental/Investment property',
    'Second home/Cottage'
  ];
  String selectedValue;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Flexible(
      child: SingleChildScrollView(
        child: Wrap(
          children: [
            LeftSideCard(
              title: 'Let’s Cover Some of the Basic’s ',
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
                        direction: width > 1350 ? Axis.horizontal : width > 800 ? Axis.vertical :   width >  650 ? Axis.horizontal : Axis.vertical ,
                        children: [
                          AutoSizeText(
                            'What city is the property in?',
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: StringRefer.SegoeUI,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            softWrap: true,
                            maxLines: 3,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.visible,
                          ),
                          SizedBox(height: 20, width: 50),
                          Container(
                            width: width > 1350 ? width / 4 : width > 800 ? width/2.5 :  width > 650 ? width/2.5  : width/1.1,
                            child: InputField(
                              readOnly: false,
                              hintText: 'Enter here',
                              onChanged: (value) {},
                              textInputType: TextInputType.text,
                            ),
                          ),
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
                        direction:
                        width > 1350 ? Axis.horizontal : width > 800 ? Axis.vertical :   width >  650 ? Axis.horizontal : Axis.vertical ,
                        children: [
                          AutoSizeText(
                            'Is this Property going to be?',
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: StringRefer.SegoeUI,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            softWrap: true,
                            maxLines: 3,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.visible,
                          ),
                          SizedBox(height: 20, width: 50),
                          Wrap(
                            direction: Axis.vertical,
                            children: [
                              Wrap(
                                direction: Axis.vertical,
                                children: tabList == null || tabList.length == 0
                                    ? [Container()]
                                    : tabList.map((element) {
                                        return Wrap(
                                          direction: Axis.vertical,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  selectedValue = element;
                                                });
                                              },
                                              child: TabCard(
                                                title: element,
                                                labelColor:
                                                    selectedValue == element
                                                        ? Color(0xff705aa7)
                                                        : Colors.white,
                                                textColor:
                                                    selectedValue == element
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
                                width: width > 1350 ? width / 4 : width > 800 ? width/2.5 :  width > 650 ? width/2.5  : width/1.1,
                                child: RoundedButton(
                                  title: 'continue',
                                  textColor: Colors.white,
                                  colour: Color(0xff705aa7),
                                  height: 60,
                                  buttonRadius: 10,
                                  onPressed: () {
                                    Navigator.push(context, PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        duration: Duration(seconds: 1),
                                        child: AmountDetailForthFlow())
                                    );
                                  },
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
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
    return InkWell(
      child: Container(
        width: width > 1350 ? width / 4 : width > 800 ? width/2.5 :  width > 650 ? width/2.5  : width/1.1,
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
    );
  }
}
