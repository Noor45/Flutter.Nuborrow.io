import 'dart:html';

import 'package:flutter/cupertino.dart';
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
