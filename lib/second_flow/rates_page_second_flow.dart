import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:nuborrow/cards/left_card.dart';
import 'package:nuborrow/first_flow/complete_application_first_flow.dart';
import 'package:nuborrow/second_flow/complete_application_second_flow.dart';
import 'package:nuborrow/utils/colors.dart';
import 'package:nuborrow/widgets/input_fields.dart';
import 'package:page_transition/page_transition.dart';
import '../cards/rate_page_card.dart';
import 'package:nuborrow/widgets/round_button.dart';
import '../utils/strings.dart';
import 'package:nuborrow/models/api_response.dart';
import 'package:nuborrow/models/bank_detail.dart';
import 'package:nuborrow/models/product.dart';
import '../utils/NetworkUtils.dart';

class RatesPage2ndFlow extends StatefulWidget {
  static const RatesPage2ndFlowId = 'rates2';
  @override
  _RatesPage2ndFlowState createState() => _RatesPage2ndFlowState();
}

class _RatesPage2ndFlowState extends State<RatesPage2ndFlow> {
  GlobalKey globalKey = new GlobalKey(debugLabel: 'btm_app_bar');
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
  }
  List<String> selectList = ['Fixed', 'Variable'];
  String selectedValue;
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
  List<String> selectRateList = ['Fixed', 'Variable'];
  String selectedRateValue;
  List<String> selectTermList = ['5 Year', '3 Year'];
  String selectedTermValue;
  Product products = new Product();
  List<dynamic> bankList  = [];
  @override
  void initState() {
    loadProductRate();
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
              showSubtitle: true,
              subtitle: '''Based on the information you’ve provided, here are the best rates on the market.''',
              title: '''Your best rates''',
              topPadding: MediaQuery.of(context).size.height / 5,
              height: width > 800 ? height : height / 2,
              font: 45,
              subtitleFont:25,
            ),
            Container(
              width: width > 800 ? width /2 : width,
              color: Color(0xfff7f9fc),
              child: Column(
                children: products.banks == null || products.banks.length == 0 ? [Container()] :
                products.banks.map((element) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 30),
                      Container(
                        child: width > 1350 ?
                        DesktopRateCard(
                          bankName: element['bank_name'],
                          icon: element['bank_logo'],
                          cardWidth: width/7.5,
                          total: element['bank_rate'],
                          monthlyPayment: 0,
                          preApproval: 'N/A',
                          prePayment: 0,
                          rateHold: 'N/A',
                          onPressed: (){
                            navigate();
                          },
                        ):
                        width > 800 ? MobileViewRateCard(
                          bankName: element['bank_name'],
                          icon: element['bank_logo'],
                          cardWidth: width/7.5,
                          total: element['bank_rate'],
                          monthlyPayment: 0,
                          preApproval: 'N/A',
                          prePayment: 0,
                          rateHold: 'N/A',
                          onPressed: (){
                            navigate();
                          },
                        ) : width > 650 ?
                        DesktopRateCard(
                          bankName: element['bank_name'],
                          icon: element['bank_logo'],
                          cardWidth: width/4,
                          total: element['bank_rate'],
                          monthlyPayment: 0,
                          preApproval: 'N/A',
                          prePayment: 0,
                          rateHold: 'N/A',
                          onPressed: (){
                            navigate();
                          },
                        ) : MobileViewRateCard(
                          bankName: element['bank_name'],
                          icon: element['bank_logo'],
                          cardWidth: width/4,
                          total: element['bank_rate'],
                          monthlyPayment: 0,
                          preApproval: 'N/A',
                          prePayment: 0,
                          rateHold: 'N/A',
                          onPressed: (){
                            navigate();
                          },
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
  navigate(){
    Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, duration: Duration(seconds: 1), child: LastPage2ndFlow()));
  }

  void loadProductRate() async {
    Map<String, dynamic> response = await NetworkUtil.internal().get("products/rates");
    print('show list of the bank');
    APIResponse apiResponse = APIResponse.fromJson(response);
    setState(() {
      products = apiResponse.products[0];
    });
    apiResponse.products.forEach((element) {
      print('name: '+element.name);
      print('description: '+element.description);
      element.banks.forEach((e) {
        print(e);
      });

    });

  }
}

