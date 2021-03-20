import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nuborrow/first_flow/second_intro_first_flow.dart';
import 'package:nuborrow/second_flow/second_intro_second_flow.dart';
import 'package:page_transition/page_transition.dart';

class MainPage extends StatefulWidget {
  static const MainPagePageId = 'main';

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
          margin: EdgeInsets.only(
              top: width > 900 ? 50 : 0, bottom: width > 900 ? 50 : 0),
          child: width > 900
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
          direction: width > 900 ? Axis.horizontal :  Axis.vertical ,
          children: [
            Container(
              height: width > 900 ? height : height / 2,
              width: width > 900 ? width / 2 : width,
              color: Colors.white,
              child: Center(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: width > 900 ? width / 5 : width > 800 ? width/3 : width/2,
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, duration: Duration(seconds: 1), child: NextIntroPageFirstFlow()));
                          },
                          child: Image.asset('assets/images/1.png'),
                        ),
                      ),
                      Container(
                        width: width > 900 ? width / 5 : width > 800 ? width/3 :  width/2,
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, duration: Duration(seconds: 1), child: NextIntroPage2ndFlow()));
                          },
                          child: Image.asset('assets/images/2.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: width > 900 ? height : height / 2,
              width: width > 900 ? width / 2 : width,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: width > 900 ? width / 5 : width > 800 ? width/3  : width/2,
                    child: InkWell(
                      onTap: (){
                        // Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, duration: Duration(seconds: 1), child: IntroPage3rdFlow()));
                      },
                      child: Image.asset('assets/images/3.png'),
                    ),
                  ),
                  Container(
                    width: width > 900 ? width / 5 : width > 800 ? width/3 :  width/2,
                    child: InkWell(
                      onTap: (){
                        // Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, duration: Duration(seconds: 1), child: IntroPageForthFlow()));
                      },
                      child: Image.asset('assets/images/4.png'),
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


class DesktopView extends StatefulWidget {
  @override
  _DesktopViewState createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
