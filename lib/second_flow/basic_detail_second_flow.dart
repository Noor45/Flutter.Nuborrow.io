import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_google_places_web/flutter_google_places_web.dart';
import 'package:nuborrow/cards/left_card.dart';
import 'package:nuborrow/first_flow/amount_detail_first_flow.dart';
import 'package:nuborrow/first_flow/pick_mortgage_term_first_flow.dart';
import 'package:nuborrow/second_flow/amount_detail_second_flow.dart';
import 'package:nuborrow/utils/colors.dart';
import 'package:nuborrow/utils/constants.dart';
import 'package:nuborrow/utils/style.dart';
import 'package:nuborrow/widgets/input_fields.dart';
import 'package:nuborrow/widgets/round_button.dart';
import 'package:page_transition/page_transition.dart';
import 'package:simple_tooltip/simple_tooltip.dart';
import '../utils/strings.dart';

class BasicDetail2ndFlow extends StatefulWidget {
  static const BasicDetailPageSecondFlowId = 'basic_detail2';
  @override
  _BasicDetail2ndFlowState createState() => _BasicDetail2ndFlowState();
}

class _BasicDetail2ndFlowState extends State<BasicDetail2ndFlow> {
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
                            child: FlutterGooglePlacesWeb(
                              apiKey: "AIzaSyDKhj1caiJVMeNgBAqbOjV97q0oMyAuRiQ",
                              components: 'country:us',
                              decoration: StyleRefer.kTextFieldDecoration
                                  .copyWith(
                                  hintText: 'Enter here',
                                  hintStyle: TextStyle(
                                      fontSize: 15,
                                      color: ColorRefer.kLabelColor)),
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
                                child: Container(
                                  width: width > 1350
                                      ? width / 4
                                      : width > 800
                                      ? width / 2.5
                                      : width > 650
                                      ? width / 2.5
                                      : width / 1.1,
                                  child: RoundedButton(
                                    title: 'continue',
                                    textColor: Colors.white,
                                    colour: Color(0xff705aa7),
                                    height: 60,
                                    buttonRadius: 10,
                                    onPressed: () {
                                      ConstantValueSecond.place = FlutterGooglePlacesWeb.value['name'];
                                      ConstantValueSecond.propertyType = selectedValue;
                                      // if (ConstantValueFirst.place == null) {
                                      //   Toast.show("Enter the city name", context,
                                      //       duration: Toast.LENGTH_SHORT,
                                      //       gravity: Toast.BOTTOM);
                                      // } else
                                      if (ConstantValueSecond.propertyType == null) {
                                        setState(() {
                                          message = 'Select the options';
                                          show = true;
                                          hideToolTip();
                                        });
                                      } else {
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                type: PageTransitionType
                                                    .rightToLeft,
                                                duration: Duration(seconds: 1),
                                                child:
                                                AmountDetail2ndFlow()));
                                      }
                                    },
                                  ),
                                ),
                                content: Text(
                                  message,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      decoration: TextDecoration.none,
                                      fontFamily: StringRefer.SFProText),
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
  hideToolTip() async {
    await Future.delayed(Duration(seconds: 3), () async {
      setState(() {
        show = false;
      });
    });
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
