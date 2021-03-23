import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';
import 'package:nuborrow/cards/amount_page_card.dart';
import 'package:nuborrow/cards/left_card.dart';
import 'package:intl/intl.dart';
import 'package:nuborrow/second_flow/pick_mortgage_term_second_flow.dart';
import 'package:nuborrow/utils/colors.dart';
import 'package:nuborrow/utils/constants.dart';
import 'package:page_transition/page_transition.dart';
import 'package:simple_tooltip/simple_tooltip.dart';
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
  TextEditingController currentHomeValueController = new TextEditingController();
  TextEditingController currentMortgageValueController = new TextEditingController();
  TextEditingController textDownPaymentController = TextEditingController();
  TextEditingController textPercentageController = TextEditingController();
  TextEditingController equityController = TextEditingController();
  TextEditingController dateController = new TextEditingController();
  bool readOnly = true;
  bool equityReadOnly = true;
  bool borrowExtraAmount = true;
  bool showToolTip = false;
  bool show = false;
  String message = '';
  setValue(){
    setState(() {
      if(ConstantValueSecond.totalBorrowAmount == ''){
        ConstantValueSecond.totalBorrowAmount = '0';
      }
    });
  }
  @override
  void initState() {
    setValue();
    super.initState();
  }
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
                    controller: currentHomeValueController,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9\$,.]')),
                    ],
                    readOnly: false,
                    showButton: false,
                    label: 'What is the current value of your home?',
                    hint: '\$ Enter amount',
                    textInputType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        try{
                          currentHomeValueController.text = moneyFormat(currentHomeValueController.text);
                          currentHomeValueController.text = moneyDollarFormat(currentHomeValueController.text);
                          currentHomeValueController.selection = TextSelection.fromPosition(TextPosition(offset: currentHomeValueController.text.length));
                          ConstantValueSecond.currentHomeValue = currentHomeValueController.text;
                          ConstantValueSecond.currentHomeValue  = ConstantValueSecond.currentHomeValue.replaceAll('\$', '');
                          currentHomeValue(ConstantValueSecond.currentHomeValue);
                          readOnly = false;
                        }catch(e){
                          print(e);
                        }
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  TextFieldCard(
                    controller: currentMortgageValueController,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9\$,.]')),
                    ],
                    showButton: false,
                    readOnly: readOnly,
                    label: 'What is your current mortgage balance?',
                    hint: '\$ Enter amount',
                    textInputType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                          try{
                            currentMortgageValueController.text = numberFormat(value);
                            currentMortgageValueController.text = moneyFormat(currentMortgageValueController.text);
                            currentMortgageValueController.text = moneyDollarFormat(currentMortgageValueController.text);
                            currentMortgageValueController.selection = TextSelection.fromPosition(TextPosition(offset: currentMortgageValueController.text.length));
                            ConstantValueSecond.currentMortgageValue = currentMortgageValueController.text;
                            ConstantValueSecond.currentMortgageValue  = ConstantValueSecond.currentMortgageValue.replaceAll('\$', '');
                            ConstantValueSecond.mortgageValue = ConstantValueSecond.currentMortgageValue;
                            currentMortgageValue(ConstantValueSecond.currentMortgageValue);
                          }catch(e){
                            print(e);
                          }
                      });
                    },
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
                                                  if(firstSelectedValue == 'No'){
                                                    borrowExtraAmount = false;
                                                    equityReadOnly = true;
                                                  }else{
                                                    borrowExtraAmount = true;
                                                    equityReadOnly = false;
                                                  }
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

                  Visibility(
                    visible: borrowExtraAmount,
                    child: Wrap(
                      children: [
                        SizedBox(height: 20),
                        SimpleTooltip(
                          ballonPadding: EdgeInsets.all(3),
                          arrowTipDistance: 3,
                          backgroundColor: Colors.black54,
                          borderColor: Colors.black26,
                          animationDuration: Duration(seconds: 1),
                          show: showToolTip,
                          tooltipDirection: width > 1350
                              ? TooltipDirection.left
                              : width > 800
                              ? TooltipDirection.up
                              : width > 650
                              ? TooltipDirection.left
                              : TooltipDirection.up,
                          child: TextFieldCard(
                            controller: equityController,
                            readOnly: equityReadOnly,
                            showButton: false,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp('[0-9\$,.]')),
                            ],
                            label: 'Up to a maximum of '+'\$'+ConstantValueSecond.totalBorrowAmount +' fromAbove',
                            hint: '\$ Enter Amount',
                            textInputType: TextInputType.number,
                            onChanged: (value) {

                              setState(() {
                                try{
                                  String tb = ConstantValueSecond.totalBorrowAmount.replaceAll(RegExp(','), '');
                                  tb = tb.replaceAll('\$', '');
                                  String va = value.replaceAll('\$', '');
                                  va = va.replaceAll(RegExp(','), '');
                                  double total = double.parse(tb);
                                  double valueAmount = double.parse(va);
                                  print(valueAmount);
                                  print(total);
                                  if(valueAmount >= total ){
                                    showToolTip = true;

                                  }
                                  else{
                                    if(showToolTip == true){
                                      hideToolTip();
                                    }
                                    equityController.text = moneyFormat(value);
                                    equityController.text = moneyDollarFormat(equityController.text);
                                    equityController.selection = TextSelection.fromPosition(TextPosition(offset: equityController.text.length));
                                    ConstantValueSecond.equityValue = equityController.text;
                                    ConstantValueSecond.equityValue  = ConstantValueSecond.equityValue.replaceAll('\$', '');
                                    totalMortgage(value);
                                  }
                                }catch(e){
                                    print(e);
                                }

                              });

                            },
                          ),
                          content: Text(
                            'You cannot access more equity than is available',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                decoration: TextDecoration.none,
                                fontFamily: StringRefer.SFProText
                            ),
                          ),
                        ),

                        SizedBox(height: 40),
                        MortgageCard(),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
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
                    child: DateTimeFieldCard(
                      controller: dateController,
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
                        setState(() {
                          if(ConstantValueSecond.currentHomeValue == ''){
                            show = true;
                            message = 'Enter the current value of home';
                            hideToolTip2();
                          }else if(ConstantValueSecond.currentMortgageValue == ''){
                            show = true;
                            message = 'Enter the current mortgage value';
                            hideToolTip2();
                          }
                          else if(dateController.text == ''){
                            show = true;
                            message = 'Select Date';
                            hideToolTip2();
                          }else{
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    duration: Duration(seconds: 1),
                                    child: MortgageTerms2ndFlow()));
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

                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  hideToolTip2()async{
    await Future.delayed(Duration(seconds: 3) , () async {
      setState(() {
        show = false;
      });
    });
  }
  hideToolTip()async{
    await Future.delayed(Duration(seconds: 2) , () async {
      setState(() {
        showToolTip = false;
      });
    });
  }

  currentHomeValue(String value){
    try{
      setState(() {
        String currentValue = value.replaceAll(RegExp(','), '');
        double currentHomeValue = double.parse(currentValue);
        double eightyPercentage = currentHomeValue * (80/100);
        print(eightyPercentage);
        ConstantValueSecond.currentHomePercentage = eightyPercentage.toStringAsFixed(0);
        ConstantValueSecond.currentHomePercentage = moneyFormat(ConstantValueSecond.currentHomePercentage);
      });
    }catch(e){
      print(e);
    }

  }
  currentMortgageValue(String value){
    try{
      setState(() {
        String currentValue = value.replaceAll(RegExp(','), '');
        double currentMortgageValue = double.parse(currentValue);
        String percentage = ConstantValueSecond.currentHomePercentage.replaceAll(RegExp(','), '');
        double eightyPercentage = double.parse(percentage);
        double totalValue = currentMortgageValue - eightyPercentage;
        ConstantValueSecond.totalBorrowAmount = totalValue.toString();
        ConstantValueSecond.totalBorrowAmount = moneyFormat(ConstantValueSecond.totalBorrowAmount);
      });
    }catch(e){
      print(e);
    }

  }

  totalMortgage(String value){
      setState(() {
        String eq = ConstantValueSecond.equityValue.replaceAll(RegExp(','), '');
        print(eq);
        String cm = ConstantValueSecond.currentMortgageValue.replaceAll(RegExp(','), '');
        print(cm);
        double equityValue = double.parse(eq);
        double mortgageValue = double.parse(cm);
        double totalMortgage = equityValue + mortgageValue;
        String mortgage = totalMortgage.toString();
        ConstantValueSecond.mortgageValue = moneyFormat(mortgage);
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
      padding: const EdgeInsets.only(top:20, left: 30, right: 30),
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
                    value: ConstantValueSecond.currentMortgageValue == '' ?
                    '\$0' : '\$' + ConstantValueSecond.currentMortgageValue,
                    color: Colors.black,
                  ),
                  SizedBox(height: 10),
                  PriceCard(
                    title: '+ Additional equity ',
                    value: ConstantValueSecond.equityValue == '' ?
                    '\$0' : '\$' + ConstantValueSecond.equityValue,
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
                value: ConstantValueSecond.mortgageValue == '' ?
                '\$0' : '\$' + ConstantValueSecond.mortgageValue,
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
                    value: ConstantValueSecond.currentHomeValue == '' ?
                    '\$0'
                    : '\$' + ConstantValueSecond.currentHomeValue,
                    color: Colors.black,
                  ),
                  SizedBox(height: 10),
                  PriceCard(
                    title: '* Max. loan to value ratio',
                    value: '80%',
                    color: Colors.black,
                  ),
                  SizedBox(height: 10),
                  PriceCard(
                    title: '= Max. Loan amount',
                    value: ConstantValueSecond.currentHomePercentage == '' ?
                    '\$0'
                    : '\$' + ConstantValueSecond.currentHomePercentage,
                    color: Colors.black,
                  ),
                  SizedBox(height: 10),
                  PriceCard(
                    title: '- current mortgage balance',
                    value: ConstantValueSecond.currentMortgageValue == '' ?
                    '\$0' : '\$' + ConstantValueSecond.currentMortgageValue,
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
                    '= borrow an additional',
                value: ConstantValueSecond.totalBorrowAmount == '' ?
                '\$0' : '\$' + ConstantValueSecond.totalBorrowAmount,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
