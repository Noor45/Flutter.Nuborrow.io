import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:nuborrow/cards/amount_page_card.dart';
import 'package:nuborrow/cards/left_card.dart';
import 'package:nuborrow/first_flow/pick_mortgage_term_first_flow.dart';
import 'package:nuborrow/utils/colors.dart';
import 'package:intl/intl.dart';
import 'package:nuborrow/widgets/input_fields.dart';
import 'package:nuborrow/widgets/round_button.dart';
import 'package:page_transition/page_transition.dart';
import '../utils/constants.dart';
import '../utils/constants.dart';
import '../utils/constants.dart';
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
  TextEditingController dateController = new TextEditingController();
  TextEditingController textDownPaymentController = TextEditingController();
  TextEditingController textPercentageController = TextEditingController();
  String price = '';
  String percentage = '';
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
                  TextFieldCardCurrency(
                    label: 'What is the price of your new home?    ',
                    hint: '\$ Enter amount',
                    textInputType: TextInputType.text,
                    value: price,
                    onChanged: (value) {
                      setState(() {
                        ConstantValue.purchaseValue = value.replaceAll('\$', '');
                      });
                    },
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
                            child: LabelCard(
                              label:
                                  'How much is your Down payment? Enter Percentage of amount',
                            ),
                          ),
                          SizedBox(
                            height: 20,
                            width: 50,
                          ),
                          Container(
                            width: width > 1100
                                ? width / 5
                                : width > 650
                                    ? width / 2.5
                                    : width / 1.1,
                            child: Wrap(
                              direction: Axis.horizontal,
                              children: [
                                Column(
                                  children: [
                                    InputField(
                                      hintText: '% Enter Percentage',
                                      controller: textPercentageController,
                                      readOnly:
                                          ConstantValue.purchaseValue == ''
                                              ? true
                                              : false,
                                      onChanged: (String value) {
                                        getPercentage(value);
                                      },
                                      textInputType: TextInputType.number,
                                    ),
                                    SizedBox(height: 5),
                                    InputField(
                                      hintText: '\$ Enter amount',
                                      readOnly:
                                          ConstantValue.purchaseValue == ''
                                              ? true
                                              : false,
                                      controller: textDownPaymentController,
                                      onChanged: (String value) {
                                        getValue(value);
                                      },
                                      textInputType: TextInputType.number,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  MortgageCard(),
                  SizedBox(height: 30),
                  DateTimeFieldCard(
                    controller: dateController,
                    label: 'When do you want to move in?',
                    hint: 'Enter Date',
                    onTab: () async {
                      var date = await Constants.showDate(context);
                      setState(() {
                        dateController.text =
                            DateFormat('yyyy-MM-dd').format(date);
                      });
                    },
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
                                  width: width > 1100
                                      ? width / 5
                                      : width > 650
                                          ? width / 2.5
                                          : width / 1.1,
                                  child: RoundedButton(
                                    title: 'continue',
                                    textColor: Colors.white,
                                    colour: Color(0xff705aa7),
                                    buttonRadius: 10,
                                    height: 60,
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType
                                                  .rightToLeft,
                                              duration: Duration(seconds: 1),
                                              child: MortgageTerms()));
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

  getPercentage(String value){
    textPercentageController.text = numberFormat(value);
    textPercentageController.text = moneyPercentageFormat(textPercentageController.text);
    textPercentageController.selection =
        TextSelection.fromPosition(
            TextPosition(
                offset:
                textPercentageController
                    .text.length));
    setState(() {
      String text = numberFormat(value);
      ConstantValue.purchaseValue = ConstantValue.purchaseValue.replaceAll(RegExp(','), '');
      double purchaseValue = double.parse(ConstantValue.purchaseValue);
      double percentage =
      double.parse(text);
      double obtained = purchaseValue *
          (percentage / 100);
      double totalMortgage = purchaseValue - obtained;
      ConstantValue.totalValue = moneyFormat(totalMortgage.toString());
      ConstantValue.obtainedValue = moneyFormat(obtained.toString());
      print(moneyFormat(obtained.toString()));
      ConstantValue.percentageValue = percentage.toString();
      textDownPaymentController.text = ConstantValue.obtainedValue;
      textDownPaymentController.text = moneyFormat(textDownPaymentController.text);
      textDownPaymentController.text = moneyDollarFormat(textDownPaymentController.text);
    });
  }

  getValue(String value){
    textDownPaymentController.text = numberFormat(value);
    textDownPaymentController.text = moneyFormat(textDownPaymentController.text);
    textDownPaymentController.text = moneyDollarFormat(textDownPaymentController.text);
    textDownPaymentController.selection = TextSelection.fromPosition(TextPosition(offset: textDownPaymentController.text.length));
    String text = numberFormat(value);
    setState(() {
      String purchase = ConstantValue.purchaseValue.replaceAll(RegExp(','), '');
      double purchaseValue = double.parse(purchase);
      double obtained = double.parse(text);
      double percentage = (obtained / purchaseValue) * 100;
      double totalMortgage = purchaseValue - obtained;
      ConstantValue.totalValue = moneyFormat(totalMortgage.toString());
      ConstantValue.obtainedValue = moneyFormat(obtained.toString());
      textPercentageController.text = moneyPercentageFormat(percentage.toStringAsFixed(2));
    });
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
                    value: ConstantValue.purchaseValue == ''
                        ? '\$0'
                        : '\$' + ConstantValue.purchaseValue,
                    color: Colors.black,
                  ),
                  SizedBox(height: 10),
                  PriceCard(
                    title: '- Down Payment',
                    value: ConstantValue.obtainedValue == ''
                        ? '\$0'
                        : '\$' + ConstantValue.obtainedValue,
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
                value: ConstantValue.totalValue == ''
                    ? '\$0'
                    : '\$' + ConstantValue.totalValue,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFieldCardCurrency extends StatefulWidget {
  TextFieldCardCurrency(
      {this.textInputType,
      this.label,
      this.hint,
      this.value,
      this.onChanged,
      this.showButton});
  final String label;
  final String value;
  final String hint;
  final Function onChanged;
  final TextInputType textInputType;
  final bool showButton;
  FocusNode nextFocus;
  @override
  _TextFieldCardCurrencyState createState() => _TextFieldCardCurrencyState();
}

class _TextFieldCardCurrencyState extends State<TextFieldCardCurrency> {
  TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    textEditingController.text = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
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
              child: LabelCard(
                label: widget.label,
              ),
            ),
            SizedBox(
              height: 20,
              width: 50,
            ),
            Container(
              width: width > 1100
                  ? width / 5
                  : width > 650
                      ? width / 2.5
                      : width / 1.1,
              child: Wrap(
                direction: Axis.horizontal,
                children: [
                  InputField(
                    readOnly: false,
                    hintText: widget.hint,
                    controller: textEditingController,
                    onChanged: (String text) {
                      textEditingController.text = numberFormat(text);
                      textEditingController.text = moneyFormat(textEditingController.text);
                      textEditingController.text = moneyDollarFormat(textEditingController.text);
                      widget.onChanged.call(textEditingController.text);
                      textEditingController.selection =
                          TextSelection.fromPosition(TextPosition(
                              offset: textEditingController.text.length));
                    },
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
                            width: width > 1100
                                ? width / 5
                                : width > 650
                                    ? width / 2.5
                                    : width / 1.1,
                            child: RoundedButton(
                              title: 'continue',
                              height: 60,
                              textColor: Colors.white,
                              colour: Color(0xff705aa7),
                              buttonRadius: 10,
                              onPressed: () {
                                widget.nextFocus.requestFocus();
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
//
// class TextFieldPercentageCard extends StatefulWidget {
//   TextFieldPercentageCard(
//       {this.textInputType,
//       this.label,
//       this.hint,
//       this.value,
//       this.onChanged,
//       this.showButton});
//   final String label;
//   final String value;
//   final String hint;
//   final Function onChanged;
//   final TextInputType textInputType;
//   final bool showButton;
//   FocusNode nextFocus;
//   @override
//   _TextFieldPercentageCardState createState() =>
//       _TextFieldPercentageCardState();
// }
//
// class _TextFieldPercentageCardState extends State<TextFieldPercentageCard> {
//   TextEditingController textEditingController = TextEditingController();
//   @override
//   void initState() {
//     super.initState();
//     textEditingController.text = widget.value;
//     print("updated" + TextInputType.text.toString());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     return Container(
//       width: width > 900 ? width / 2 : width,
//       child: Padding(
//         padding: EdgeInsets.only(left: 30, right: 30),
//         child: Wrap(
//           direction: width > 1100
//               ? Axis.horizontal
//               : width > 650
//                   ? Axis.horizontal
//                   : Axis.vertical,
//           children: [
//             Container(
//               width: width > 1100
//                   ? width / 5
//                   : width > 650
//                       ? width / 2.5
//                       : width,
//               child: LabelCard(
//                 label: widget.label,
//               ),
//             ),
//             SizedBox(
//               height: 20,
//               width: 60,
//             ),
//             Container(
//               width: width > 1100
//                   ? width / 5
//                   : width > 650
//                       ? width / 2.5
//                       : width / 1.1,
//               child: Wrap(
//                 direction: Axis.horizontal,
//                 children: [
//                   InputField(
//                     hintText: widget.hint,
//                     readOnly: false,
//                     controller: textEditingController,
//                     onChanged: (String text) {
//                       textEditingController.text = moneyPercentageFormat(text);
//                       // textEditingController.text = moneyDollarFormat(textEditingController.text);
//                       widget.onChanged.call(textEditingController.text);
//                       textEditingController.selection =
//                           TextSelection.fromPosition(TextPosition(
//                               offset: textEditingController.text.length));
//                     },
//                     textInputType: widget.textInputType,
//                   ),
//                   Visibility(
//                     visible: widget.showButton,
//                     child: Wrap(
//                       direction: Axis.horizontal,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(top: 50),
//                           child: Container(
//                             width: width > 1100
//                                 ? width / 5
//                                 : width > 650
//                                     ? width / 2.5
//                                     : width / 1.1,
//                             child: RoundedButton(
//                               title: 'continue',
//                               height: 60,
//                               textColor: Colors.white,
//                               colour: Color(0xff705aa7),
//                               buttonRadius: 10,
//                               onPressed: () {
//                                 widget.nextFocus.requestFocus();
//                               },
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
