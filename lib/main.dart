import 'package:flutter/material.dart';
import 'package:nuborrow/first_flow/basic_detail_page.dart';
import 'package:nuborrow/first_flow/complete_application_page.dart';
import 'package:nuborrow/first_flow/contact_detail.dart';
import 'package:nuborrow/first_flow/pick_mortgage_term.dart';
import 'package:nuborrow/first_flow/rates_page.dart';
import 'package:nuborrow/first_flow/second_intro_page.dart';
import 'package:nuborrow/second_flow/basic_detail_page.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'first_flow/intro_page.dart';
import 'first_flow/amount_detail.dart';
import 'first_flow/basic_detail_page.dart';
import 'first_flow/second_intro_page.dart';
import 'second_flow/second_intro_page.dart';
import 'second_flow/intro_page.dart';

import 'dart:async';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, widget),
        maxWidth: 1400,
        minWidth: 480,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(480, name: MOBILE),
          ResponsiveBreakpoint.resize(800, name: TABLET),
          ResponsiveBreakpoint.resize(1400, name: DESKTOP),
        ],
        background: Container(color: Color(0xFFF5F5F5)),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: IntroPageFirstFlow.IntroPageFirstFlowId,
      routes: {
        //First Flow Pages
        IntroPageFirstFlow.IntroPageFirstFlowId: (context) => IntroPageFirstFlow(),
        NextIntroPageFirstFlow.SecondIntroPageFirstFlowId: (context) => NextIntroPageFirstFlow(),
        BasicDetailFirstFlow.BasicDetailPageFirstFlowId: (context) => BasicDetailFirstFlow(),
        MortgageTerms.MortgageTermsPageId: (context) => MortgageTerms(),
        ContactDetail.ContactDetailPageId: (context) => ContactDetail(),
        AmountDetailFirstFlow.AmountDetailPageFirstFlowId: (context) => AmountDetailFirstFlow(),
        RatesPageFirstFlow.RatesPageFirstFlowId: (context) => RatesPageFirstFlow(),
        LastPageFirstFlow.LastPageFirstFlowId: (context) => LastPageFirstFlow(),

        //Second Flow Pages
        IntroPage2ndFlow.IntroPageId2ndFlow: (context) => IntroPage2ndFlow(),
        NextIntroPage2ndFlow.SecondIntroPage2ndFlowId: (context) => NextIntroPage2ndFlow(),
        BasicDetail2ndFlow.BasicDetailPageSecondFlowId: (context) => BasicDetail2ndFlow(),


      },
    );
  }
}
