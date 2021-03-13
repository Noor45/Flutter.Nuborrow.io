import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nuborrow/pages/second_intro_page.dart';
import 'package:nuborrow/widgets/round_button.dart';
import '../utils/strings.dart';

class IntroPage extends StatefulWidget {
  static const IntroPageId = 'continue';
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
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
              height: width > 700 ? height : height/1.5,
              width: width > 700 ? width / 2 : width,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: width > 700 ? width / 3 : width / 1.3,
                    child: LabelCard(
                      icon: 'assets/svg/refinancing.svg',
                      label: 'Buying a home',
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: width > 700 ? width / 3 : width / 1.3,
                    child: LabelCard(
                      icon: 'assets/svg/refinancing.svg',
                      label: 'Refinancing my home',
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: width > 700 ? width / 3 : width / 1.3,
                    child: LabelCard(
                      icon: 'assets/svg/credit.svg',
                      label: 'Adding a Line of Credit',
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: width > 700 ? width / 3 : width / 1.3,
                    child: LabelCard(
                      icon: 'assets/svg/wallet.svg',
                      label: 'Adding a Home Equity Loan',
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
                    child: AutoSizeText(
                      'I’m Buying a Home',
                      style: TextStyle(fontSize: 22, fontFamily: StringRefer.Poppins, fontWeight: FontWeight.bold, color: Colors.white),
                      softWrap: true,
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: Flexible(
                      child: AutoSizeText(
                        'I’m looking for a new mortgage for my new home.',
                        style: TextStyle(fontSize: 18, fontFamily: StringRefer.SegoeUI, fontWeight: FontWeight.bold, color: Colors.white),
                        softWrap: true,
                        maxLines: 3,
                        textAlign: TextAlign.center,
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
                        Navigator.pushNamedAndRemoveUntil(context, SecondIntroPage.SecondIntroPageId, (route) => false);
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

class LabelCard extends StatefulWidget {
  LabelCard({this.icon, this.label});
  final String icon;
  final String label;
  @override
  _LabelCardState createState() => _LabelCardState();
}

class _LabelCardState extends State<LabelCard> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Color(0xfff7f9fc),
            radius: 40,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30,
              child: Container(
                child: SvgPicture.asset(
                  widget.icon,
                  width: 40,
                  height: 40,
                ),
              ),
            ),
          ),
          SizedBox(width: 20),
          Flexible(
            child: AutoSizeText(
              widget.label,
              style:
                  TextStyle(fontSize: 18, fontFamily: StringRefer.PoppinMedium),
              softWrap: true,
              maxLines: 3,
              overflow: TextOverflow.visible,
            ),
          )
        ],
      ),
    );
  }
}
