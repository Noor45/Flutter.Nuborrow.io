import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:nuborrow/pages/basic_detail_page.dart';
import 'package:nuborrow/widgets/round_button.dart';
import '../utils/strings.dart';
import 'basic_detail_page.dart';

class SecondIntroPage extends StatefulWidget {
  static const SecondIntroPageId = 'intro';
  @override
  _SecondIntroPageState createState() => _SecondIntroPageState();
}

class _SecondIntroPageState extends State<SecondIntroPage> {
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
          child: width > 700
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
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Flexible(
      child: SingleChildScrollView(
        child: Wrap(
          children: [
            Container(
              height: width > 700 ? height : height/2,
              width: width > 700 ? width / 2 : width,
              color: Color(0xff705aa7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: AutoSizeText(
                      'I’ve Found a Property',
                      style: TextStyle(fontSize: 30, fontFamily: StringRefer.Poppins, fontWeight: FontWeight.w900, color: Colors.white),
                      softWrap: true,
                      maxLines: 3,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  SizedBox(height: 20),
                  Flexible(
                    child: AutoSizeText(
                      'Show my today’s lowest rates',
                      style: TextStyle(fontSize: 18, fontFamily: StringRefer.SegoeUI, color: Colors.white),
                      softWrap: true,
                      maxLines: 3,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: Container(
                      width: MediaQuery.of(context).size.width/5,
                      child: RoundedButton(
                        title: 'continue',
                        colour: Color(0xfffecf09),
                        buttonRadius: 5,
                        onPressed: (){
                          Navigator.pushNamed(context, BasicDetail.BasicDetailPageId);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: width > 700 ? height : height/2,
              width: width > 700 ? width / 2 : width,
              color: Color(0xff2e184f),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(left: 90, right: 90),
                      child: AutoSizeText(
                        'I’m still looking at homes or I’ve found a Property',
                        style: TextStyle(fontSize: 30, fontFamily: StringRefer.Poppins, fontWeight: FontWeight.w900, color: Colors.white),
                        softWrap: true,
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(left: 120, right: 120),
                    child: Flexible(
                      child: AutoSizeText(
                        'Show me what the monthly payments and rates could be for my price range',
                        style: TextStyle(fontSize: 18, fontFamily: StringRefer.SegoeUI, color: Colors.white),
                        softWrap: true,
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width/5,
                    child: RoundedButton(
                      title: 'continue',
                      colour: Color(0xfffecf09),
                      buttonRadius: 5,
                      onPressed: (){
                        Navigator.pushNamed(context, BasicDetail.BasicDetailPageId);
                      },
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
