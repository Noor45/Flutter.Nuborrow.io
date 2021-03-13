import 'package:flutter/material.dart';
import 'package:nuborrow/pages/basic_detail_page.dart';
import 'package:nuborrow/pages/contact_detail.dart';
import 'package:nuborrow/pages/pick_mortgage_term.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'pages/intro_page.dart';
import 'pages/amount_detail.dart';
import 'pages/basic_detail_page.dart';
import 'pages/second_intro_page.dart';
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
      initialRoute: IntroPage.IntroPageId,
      routes: {
        IntroPage.IntroPageId: (context) => IntroPage(),
        SecondIntroPage.SecondIntroPageId: (context) => SecondIntroPage(),
        BasicDetail.BasicDetailPageId: (context) => BasicDetail(),
        MortgageTerms.MortgageTermsPageId: (context) => MortgageTerms(),
        ContactDetail.ContactDetailPageId: (context) => ContactDetail(),
        AmountDetail.AmountDetailPageId: (context) => AmountDetail(),
      },
    );
  }
}
