import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nuborrow/cards/left_card.dart';
import 'package:nuborrow/utils/colors.dart';
import 'package:nuborrow/utils/style.dart';
import 'package:nuborrow/widgets/round_button.dart';
import '../utils/strings.dart';

class DesktopRateCard extends StatefulWidget {
  DesktopRateCard({this.cardWidth, this.monthlyPayment, this.preApproval, this.prePayment, this.rateHold, this.total, this.onPressed,});
  final double cardWidth;
  final double monthlyPayment;
  final String rateHold;
  final double prePayment;
  final String preApproval;
  final double total;
  final Function onPressed;
  @override
  _DesktopRateCardState createState() => _DesktopRateCardState();
}

class _DesktopRateCardState extends State<DesktopRateCard> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Container(
        height: height/4,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(left: BorderSide(color: ColorRefer.kBorderColor, width: 1.0), right: BorderSide(color: ColorRefer.kBorderColor, width: 1.0), top: BorderSide(color: ColorRefer.kBorderColor, width: 1.0), bottom: BorderSide(color: ColorRefer.kBorderColor, width: 1.0),),
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/images/sideIcon.png', width: 30, height: 30,),
                      SizedBox(width: 15),
                      AutoSizeText('Lorem ipsum', style: TextStyle(fontFamily: StringRefer.PoppinMedium, fontSize: 14),)
                    ],
                  ),
                  AutoSizeText('About this rate', style: TextStyle(fontFamily: StringRefer.PoppinMedium, fontSize: 14),),
                  Row(
                    children: [
                      AutoSizeText('Monthly prepayment:', style: TextStyle(fontFamily: StringRefer.PoppinMedium, fontSize: 14),),
                      SizedBox(width: 2),
                      AutoSizeText(widget.monthlyPayment.toString()+'%', style: TextStyle(fontFamily: StringRefer.PoppinMedium, fontWeight: FontWeight.w900, fontSize: 14),)
                    ],
                  ),
                  Row(
                    children: [
                      AutoSizeText('Rate hold:', style: TextStyle(fontFamily: StringRefer.PoppinMedium, fontSize: 14),),
                      SizedBox(width: 2),
                      AutoSizeText(widget.rateHold, style: TextStyle(fontFamily: StringRefer.PoppinMedium, fontWeight: FontWeight.w900, fontSize: 14),)
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/images/sideIcon.png', width: 25, height: 25, color: Colors.white,),
                      SizedBox(width: 15),
                      AutoSizeText('Lorem ipsum', style: TextStyle(fontFamily: StringRefer.PoppinMedium, fontSize: 14, color: Colors.white),)
                    ],
                  ),
                  AutoSizeText('About this rate', style: TextStyle(fontFamily: StringRefer.PoppinMedium, fontSize: 14, color: Colors.white,),),
                  Row(
                    children: [
                      AutoSizeText('Lump sum prepayment:', style: TextStyle(fontFamily: StringRefer.PoppinMedium, fontSize: 14)),
                      SizedBox(width: 2),
                      AutoSizeText(widget.prePayment.toString()+'%', style: TextStyle(fontFamily: StringRefer.PoppinMedium, fontWeight: FontWeight.w900, fontSize: 14),)
                    ],
                  ),
                  Row(
                    children: [
                      AutoSizeText('Rate hold:', style: TextStyle(fontFamily: StringRefer.PoppinMedium, fontSize: 14),),
                      SizedBox(width: 2),
                      AutoSizeText(widget.preApproval, style: TextStyle(fontFamily: StringRefer.PoppinMedium, fontWeight: FontWeight.w900, fontSize: 14),)
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Stack(
                    overflow: Overflow.visible,
                    children: [
                      Container(
                        height: height/8,
                        width: widget.cardWidth,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(left: BorderSide(color: ColorRefer.kBorderColor, width: 1.0), right: BorderSide(color: ColorRefer.kBorderColor, width: 1.0), top: BorderSide(color: ColorRefer.kBorderColor, width: 1.0), bottom: BorderSide(color: ColorRefer.kBorderColor, width: 1.0),),
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                        child: Center(
                          child: Text(
                              widget.total.toString()+'%',
                              style: TextStyle(fontFamily: StringRefer.Poppins, fontWeight: FontWeight.w900, fontSize: 23)
                          ),
                        ),
                      ),
                      Positioned(
                        left: 45,
                        top: -9,
                        child: Container(color: Colors.white, child: AutoSizeText('Find out more',  style: TextStyle(fontFamily: StringRefer.Poppins, fontSize: 14))),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: widget.cardWidth,
                    child: RateButton(
                        title: 'Yes, show me my rates',
                        textColor: Colors.white,
                        colour: Color(0xff705aa7),
                        height:50,
                        font: 12,
                        buttonRadius: 5,
                        onPressed: widget.onPressed
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MobileViewRateCard extends StatefulWidget {
  MobileViewRateCard({this.cardWidth, this.monthlyPayment, this.preApproval, this.prePayment, this.rateHold, this.total, this.onPressed});
  final double cardWidth;
  final double monthlyPayment;
  final String rateHold;
  final double prePayment;
  final String preApproval;
  final double total;
  final Function onPressed;
  @override
  _MobileViewRateCardState createState() => _MobileViewRateCardState();
}

class _MobileViewRateCardState extends State<MobileViewRateCard> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Container(
        height: height/3,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(left: BorderSide(color: ColorRefer.kBorderColor, width: 1.0), right: BorderSide(color: ColorRefer.kBorderColor, width: 1.0), top: BorderSide(color: ColorRefer.kBorderColor, width: 1.0), bottom: BorderSide(color: ColorRefer.kBorderColor, width: 1.0),),
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/images/sideIcon.png', width: 20, height: 20,),
                      SizedBox(width: 15),
                      AutoSizeText('Lorem ipsum', style: TextStyle(fontFamily: StringRefer.PoppinMedium, fontSize: 14),)
                    ],
                  ),
                  AutoSizeText('About this rate', style: TextStyle(fontFamily: StringRefer.PoppinMedium, fontSize: 14),),
                  Row(
                    children: [
                      AutoSizeText('Monthly prepayment:', style: TextStyle(fontFamily: StringRefer.PoppinMedium, fontSize: 14),),
                      SizedBox(width: 2),
                      AutoSizeText(widget.monthlyPayment.toString()+'%', style: TextStyle(fontFamily: StringRefer.PoppinMedium, fontWeight: FontWeight.w900, fontSize: 14),)
                    ],
                  ),
                  Row(
                    children: [
                      AutoSizeText('Rate hold:', style: TextStyle(fontFamily: StringRefer.PoppinMedium, fontSize: 14),),
                      SizedBox(width: 2),
                      AutoSizeText(widget.rateHold, style: TextStyle(fontFamily: StringRefer.PoppinMedium, fontWeight: FontWeight.w900, fontSize: 14),)
                    ],
                  ),
                  Row(
                    children: [
                      AutoSizeText('Lump sum prepayment:', style: TextStyle(fontFamily: StringRefer.PoppinMedium, fontSize: 14),),
                      SizedBox(width: 2),
                      AutoSizeText(widget.prePayment.toString()+'%', style: TextStyle(fontFamily: StringRefer.PoppinMedium, fontWeight: FontWeight.w900, fontSize: 14),)
                    ],
                  ),
                  Row(
                    children: [
                      AutoSizeText('Rate hold:', style: TextStyle(fontFamily: StringRefer.PoppinMedium, fontSize: 14),),
                      SizedBox(width: 2),
                      AutoSizeText(widget.preApproval, style: TextStyle(fontFamily: StringRefer.PoppinMedium, fontWeight: FontWeight.w900, fontSize: 14),)
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Stack(
                    overflow: Overflow.visible,
                    children: [
                      Container(
                        height: height/8,
                        width: widget.cardWidth,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(left: BorderSide(color: ColorRefer.kBorderColor, width: 1.0), right: BorderSide(color: ColorRefer.kBorderColor, width: 1.0), top: BorderSide(color: ColorRefer.kBorderColor, width: 1.0), bottom: BorderSide(color: ColorRefer.kBorderColor, width: 1.0),),
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                        child: Center(
                          child: Text(
                              widget.total.toString()+'%',
                              style: TextStyle(fontFamily: StringRefer.Poppins, fontWeight: FontWeight.w900, fontSize: 23)
                          ),
                        ),
                      ),
                      Positioned(
                        left: 10,
                        top: -9,
                        child: Container(color: Colors.white, child: AutoSizeText('Find out more',  style: TextStyle(fontFamily: StringRefer.Poppins, fontSize: 12))),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: widget.cardWidth,
                    child: RateButton(
                      title: 'Yes, show me my rates',
                      textColor: Colors.white,
                      colour: Color(0xff705aa7),
                      height:50,
                      font: 12,
                      buttonRadius: 5,
                      onPressed: widget.onPressed,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


