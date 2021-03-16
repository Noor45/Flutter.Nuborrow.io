import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nuborrow/cards/left_card.dart';
import 'package:nuborrow/first_flow/pick_mortgage_term.dart';
import 'package:nuborrow/utils/colors.dart';
import 'package:nuborrow/utils/style.dart';
import 'package:nuborrow/widgets/input_fields.dart';
import 'package:nuborrow/widgets/round_button.dart';
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
              showSubtitle: false,
              subtitle: '',
              title:'''Let’s talk about your needs ''',
              topPadding: MediaQuery.of(context).size.height / 5,
              height: width > 900 ? height : height / 1.5,
              font: 40,
            ),
            Container(
              // height: width > 900 ? height : height,
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
                    onChanged: (value) {},
                    showButton: false,
                  ),
                  SizedBox(height: 20),
                  TextFieldCard(
                    label: 'How much do you have as a Down payment? (enter a %)',
                    hint: 'Enter amount',
                    textInputType: TextInputType.number,
                    onChanged: (value) {},
                    showButton: false,
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
                          Container(
                            width : width > 800  ? width/5 : width,
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
                                        SizedBox(height: 15),
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
                                      ],
                                    );
                                  }).toList(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 40),
                                  child: Container(
                                    width: width > 800 ? width / 5 : width / 2,
                                    child: RoundedButton(
                                      title: 'continue',
                                      textColor: Colors.white,
                                      colour: Color(0xff705aa7),
                                      buttonRadius: 10,
                                      height: 60,
                                      onPressed: () {
                                        Navigator.pushNamed(context,
                                            MortgageTerms.MortgageTermsPageId);
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
                              title: 'continue',
                              height: 60,
                              textColor: Colors.white,
                              colour: Color(0xff705aa7),
                              buttonRadius: 10,
                              onPressed: () {
                                Navigator.pushNamed(context,
                                    MortgageTerms.MortgageTermsPageId);
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

class DateTimeFieldCard extends StatefulWidget {
  DateTimeFieldCard(
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
  _DateTimeFieldCardState createState() => _DateTimeFieldCardState();
}

class _DateTimeFieldCardState extends State<DateTimeFieldCard> {
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
                  DateTimeField(
                    hintText: widget.hint,
                    onChanged: widget.onChanged,
                    textInputType: widget.textInputType,
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

class PriceCard extends StatefulWidget {
  PriceCard({this.title, this.value, this.color});
  final String title;
  final String value;
  final Color color;
  @override
  _PriceCardState createState() => _PriceCardState();
}

class _PriceCardState extends State<PriceCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 50, right: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: AutoSizeText(
              widget.title,
              maxLines: 3,
              softWrap: true,
              overflow: TextOverflow.visible,
              style: TextStyle(fontFamily: StringRefer.SegoeUI, fontSize: 18, color: widget.color),
            ),
          ),
          AutoSizeText(widget.value, style: TextStyle(fontFamily: StringRefer.SegoeUI, fontSize: 18, color: widget.color),),
        ],
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
        // height: MediaQuery.of(context).size.height/2.5,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(left: BorderSide(color: ColorRefer.kBorderColor, width: 1.0), right: BorderSide(color: ColorRefer.kBorderColor, width: 1.0), top: BorderSide(color: ColorRefer.kBorderColor, width: 1.0), bottom: BorderSide(color: ColorRefer.kBorderColor, width: 1.0),),
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
                      style: TextStyle(fontFamily: StringRefer.SegoeUI, fontSize: 20),
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
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0)),
              ),
              child: PriceCard(
                title: '= Did you know you could borrow an additional [\$amount]',
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
          border: Border(left: BorderSide(color: ColorRefer.kBorderColor, width: 1.0), right: BorderSide(color: ColorRefer.kBorderColor, width: 1.0), top: BorderSide(color: ColorRefer.kBorderColor, width: 1.0), bottom: BorderSide(color: ColorRefer.kBorderColor, width: 1.0),),
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
                      style: TextStyle(fontFamily: StringRefer.SegoeUI, fontSize: 20),
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
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0)),
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
    );
  }
}
