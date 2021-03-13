import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui';

import 'colors.dart';

class StyleRefer {


  static var kTextFieldDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ColorRefer.kLightColor, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ColorRefer.kLightColor, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
  );

  static var kTabDecoration = BoxDecoration(

    border: Border(left: BorderSide(color: ColorRefer.kLightColor, width: 1.0), right: BorderSide(color: ColorRefer.kLightColor, width: 1.0), top: BorderSide(color: ColorRefer.kLightColor, width: 1.0), bottom: BorderSide(color: ColorRefer.kLightColor, width: 1.0),),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  );
}