import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nuborrow/pages/pick_mortgage_term.dart';
import 'package:nuborrow/utils/style.dart';
import 'package:nuborrow/widgets/input_fields.dart';
import 'package:nuborrow/widgets/round_button.dart';
import '../utils/strings.dart';

class BasicDetail extends StatefulWidget {
  static const BasicDetailPageId = 'basic_detail';
  @override
  _BasicDetailState createState() => _BasicDetailState();
}

class _BasicDetailState extends State<BasicDetail> {
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
            Container(
              height: width > 800 ? height : height / 2,
              width: width > 800 ? width / 2 : width,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 4,
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
                              'Let’s Cover Some of the Basic’s ',
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
                          Flexible(
                            child: AutoSizeText(
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
                          ),
                          Flexible(
                            child: Container(
                              width: width > 800 ? width / 4 : width / 2,
                              child: InputField(
                                hintText: 'Enter here',
                                onChanged: (value) {},
                                textInputType: TextInputType.text,
                              ),
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
                            width > 800 ? Axis.horizontal : Axis.vertical,
                        spacing: width > 800 ? 40 : 40,
                        children: [
                          Flexible(
                            child: AutoSizeText(
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
                          ),
                          Expanded(
                            child: Wrap(
                              direction: Axis.vertical,
                              children: [
                                Wrap(
                                  direction: Axis.vertical,
                                  children: tabList == null ||
                                          tabList.length == 0
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
                                  width: MediaQuery.of(context).size.width / 4,
                                  child: RoundedButton(
                                    title: 'continue',
                                    textColor: Colors.white,
                                    colour: Color(0xff705aa7),
                                    buttonRadius: 10,
                                    onPressed: () {
                                      Navigator.pushNamed(context,
                                          MortgageTerms.MortgageTermsPageId);
                                    },
                                  ),
                                ),
                              ],
                            ),
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

// class TextCard extends StatefulWidget {
//   @override
//   _TextCardState createState() => _TextCardState();
// }
//
// class _TextCardState extends State<TextCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       spacing: 40,
//       children: [
//         Flexible(
//           child: AutoSizeText(
//             'What city is the property in?',
//             style: TextStyle(
//                 fontSize: 18,
//                 fontFamily: StringRefer.SegoeUI,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black),
//             softWrap: true,
//             maxLines: 3,
//             textAlign: TextAlign.center,
//             overflow: TextOverflow.visible,
//           ),
//         ),
//         Flexible(
//           child: InputField(
//             hintText: 'Enter here',
//             onChanged: (value) {},
//             textInputType: TextInputType.text,
//           ),
//         ),
//       ],
//     );
//   }
// }

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
        // onTap: () {
        //   setState(() {
        //     selectedValue = widget.title;
        //   });
        // },
        child: Container(
          width: width > 800 ? width / 4 : width / 2,
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
