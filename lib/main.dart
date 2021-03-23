import 'package:flutter/material.dart';
import 'package:nuborrow/first_flow/basic_detail_first_flow.dart';
import 'package:nuborrow/first_flow/complete_application_first_flow.dart';
import 'package:nuborrow/first_flow/contact_detail_first_flow.dart';
import 'package:nuborrow/first_flow/pick_mortgage_term_first_flow.dart';
import 'package:nuborrow/first_flow/rates_page_first_flow.dart';
import 'package:nuborrow/first_flow/second_intro_first_flow.dart';
import 'package:nuborrow/forth_flow/amount_detail_forth_flow.dart';
import 'package:nuborrow/forth_flow/basic_detail_forth_flow.dart';
import 'package:nuborrow/forth_flow/complete_application_forth_flow.dart';
import 'package:nuborrow/forth_flow/contact_detail_forth_flow.dart';
import 'package:nuborrow/forth_flow/intro_page_forth_flow.dart';
import 'package:nuborrow/forth_flow/rates_page_forth_flow.dart';
import 'package:nuborrow/main_page.dart';
import 'package:nuborrow/second_flow/amount_detail_second_flow.dart';
import 'package:nuborrow/second_flow/basic_detail_second_flow.dart';
import 'package:nuborrow/second_flow/complete_application_second_flow.dart';
import 'package:nuborrow/second_flow/contact_detail_second_flow.dart';
import 'package:nuborrow/second_flow/pick_mortgage_term_second_flow.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:nuborrow/second_flow/rates_page_second_flow.dart';
import 'first_flow/intro_page_first_flow.dart';
import 'first_flow/amount_detail_first_flow.dart';
import 'first_flow/basic_detail_first_flow.dart';
import 'first_flow/second_intro_first_flow.dart';
import 'second_flow/second_intro_second_flow.dart';
import 'second_flow/intro_page_second_flow.dart';
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
      initialRoute: MainPage.MainPagePageId,
      routes: {
        MainPage.MainPagePageId: (context) => MainPage(),
        //First Flow Pages
        IntroPageFirstFlow.IntroPageFirstFlowId: (context) =>
            IntroPageFirstFlow(),
        NextIntroPageFirstFlow.SecondIntroPageFirstFlowId: (context) =>
            NextIntroPageFirstFlow(),
        BasicDetailFirstFlow.BasicDetailPageFirstFlowId: (context) =>
            BasicDetailFirstFlow(),
        MortgageTerms.MortgageTermsPageId: (context) => MortgageTerms(),
        ContactDetail.ContactDetailPageId: (context) => ContactDetail(),
        AmountDetailFirstFlow.AmountDetailPageFirstFlowId: (context) =>
            AmountDetailFirstFlow(),
        RatesPageFirstFlow.RatesPageFirstFlowId: (context) =>
            RatesPageFirstFlow(),
        LastPageFirstFlow.LastPageFirstFlowId: (context) => LastPageFirstFlow(),

        //Second Flow Pages
        IntroPage2ndFlow.IntroPageId2ndFlow: (context) => IntroPage2ndFlow(),
        NextIntroPage2ndFlow.SecondIntroPage2ndFlowId: (context) =>
            NextIntroPage2ndFlow(),
        BasicDetail2ndFlow.BasicDetailPageSecondFlowId: (context) =>
            BasicDetail2ndFlow(),
        AmountDetail2ndFlow.AmountDetail2ndFlowPageId: (context) =>
            AmountDetail2ndFlow(),
        MortgageTerms2ndFlow.MortgageTerms2ndFlowPageId: (context) =>
            MortgageTerms2ndFlow(),
        ContactDetail2ndFlow.ContactDetail2ndFlowPageId: (context) =>
            ContactDetail2ndFlow(),
        RatesPage2ndFlow.RatesPage2ndFlowId: (context) => RatesPage2ndFlow(),
        LastPage2ndFlow.LastPage2ndFlowId: (context) => LastPage2ndFlow(),

        //Forth Flow Pages
        IntroPageForthFlow.IntroPageIdForthFlow: (context) =>
            IntroPageForthFlow(),
        BasicDetailForthFlow.BasicDetailPageForthFlowId: (context) =>
            BasicDetailForthFlow(),
        AmountDetailForthFlow.AmountDetailForthFlowPageId: (context) =>
            AmountDetailForthFlow(),
        ContactDetailForthFlow.ContactDetailForthFlowPageId: (context) =>
            ContactDetailForthFlow(),
        RatesPageForthFlow.RatesPageForthFlowId: (context) =>
            RatesPageForthFlow(),
        LastPageForthFlow.LastPageForthFlowId: (context) => LastPageForthFlow(),
      },
    );
  }
}
