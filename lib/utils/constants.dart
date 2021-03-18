import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

void kNavigateNext({BuildContext context, Widget widget}) {
  Navigator.push(
      context,
      PageTransition(
          type: PageTransitionType.rightToLeft,
          child: widget,
          inheritTheme: true,
          ctx: context));
}

void kNavigateAndPopNext({BuildContext context, Widget widget}) {
  Navigator.pushReplacement(
      context,
      PageTransition(
          type: PageTransitionType.rightToLeft,
          child: widget,
          inheritTheme: true,
          ctx: context));
}

void kNavigateAndPopAll({BuildContext context, Widget widget}) {
  Navigator.pushReplacement(
      context,
      PageTransition(
          type: PageTransitionType.rightToLeft,
          child: widget,
          inheritTheme: true,
          ctx: context));
}

String moneyFormat(String price) {
  if (price.length > 2) {
    var value = price;
    value = value.replaceAll(RegExp(r'\D'), '');
    value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
    return value;
  }
}

class Constants {
  static Future<DateTime> showDate(BuildContext context) async{
    var date = await showDatePicker(
      context: context,
      initialDatePickerMode: DatePickerMode.day,
      initialDate: DateTime.now(),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Color(0xff705aa7),
            accentColor: Color(0xff705aa7),
            colorScheme: ColorScheme.light(primary: Color(0xff705aa7)),
            buttonTheme: ButtonThemeData(
                textTheme: ButtonTextTheme.primary
            ),
          ),
          child: child,
        );
      },
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    return date;
  }
}

