import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nuborrow/utils/colors.dart';
import 'package:nuborrow/widgets/round_button.dart';
import '../utils/strings.dart';

class LastPage2ndFlow extends StatefulWidget {
  static const LastPage2ndFlowId = 'complete_application2';
  @override
  _LastPage2ndFlowState createState() => _LastPage2ndFlowState();
}

class _LastPage2ndFlowState extends State<LastPage2ndFlow> {
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
          color: Colors.white,
          margin: EdgeInsets.only(top: width > 1100 ? 50 : 0, bottom: width > 1100 ? 50 : 0),
          padding: EdgeInsets.only(top: 60),
          child:  Column(
            children: [
              Container(
                width: width,
                color: Color(0xffD7D1E6),
                child: Padding(
                  padding:  EdgeInsets.fromLTRB(0, 50, 0, 50),
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children:[
                                WidgetSpan(
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 5),
                                    child: SvgPicture.asset('assets/svg/like.svg', width: 25, height: 25,),
                                  ),
                                ),
                                TextSpan(text: 'Great news, your request has been sent! ',  style: TextStyle(fontFamily: StringRefer.Poppin, fontSize: 20, fontWeight: FontWeight.w900)),
                                TextSpan(text: ' A Nuborrow team member will get in touch with you in minutes.', style: new TextStyle(fontFamily: StringRefer.Poppin, fontSize: 20)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height:60),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: AutoSizeText(
                    'You are a few steps closer to securing the best rate.',
                    style: TextStyle(fontSize: 28, fontFamily: StringRefer.Poppins, fontWeight: FontWeight.w900, color: Colors.black),
                    softWrap: true,
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ),
              SizedBox(height:30),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 60, right: 60),
                  child: AutoSizeText(
                    'Fast track the process and complete our secure, no obligation online application so we can narrow down the very best rate you qualify for.',
                    style: TextStyle(fontSize: 20, fontFamily: StringRefer.Poppins, fontWeight: FontWeight.bold, color: Colors.black),
                    softWrap: true,
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ),
              SizedBox(height:40),
              RoundedButton(
                title: 'Complete the application ',
                textColor: Colors.white,
                height: 60,
                colour: Color(0xff705aa7),
                buttonRadius: 10,
                onPressed: () {
                  // Navigator.pushNamed(context,
                  //     ContactDetail.ContactDetailPageId);
                },
              ),
              Container(
                height: height/5,
                child: width > 800 ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('assets/svg/web.svg', width: 30, height: 30,),
                        SizedBox(width: 5),
                        AutoSizeText(
                          'Free to apply',
                          style: TextStyle(
                              fontFamily: StringRefer.Poppin,
                              fontSize: 20,
                              color: ColorRefer.kBorderColor,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset('assets/svg/score.svg', width: 30, height: 30,),
                        SizedBox(width: 5),
                        AutoSizeText(
                          'Free credit score',
                          style: TextStyle(fontFamily: StringRefer.Poppin, fontSize: 20, color: ColorRefer.kBorderColor,),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset('assets/svg/secure.svg', width: 30, height: 30,),
                        SizedBox(width: 5),
                        AutoSizeText(
                          'Your information is secured ',
                          style: TextStyle(fontFamily: StringRefer.Poppin, fontSize: 20, color: ColorRefer.kBorderColor,),
                        )
                      ],
                    ),
                  ],
                ) :
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/svg/web.svg', width: 30, height: 30,),
                        SizedBox(width: 5),
                        AutoSizeText(
                          'Free to apply',
                          style: TextStyle(
                            fontFamily: StringRefer.Poppin,
                            fontSize: 20,
                            color: ColorRefer.kBorderColor,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height:20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/svg/score.svg', width: 30, height: 30,),
                        SizedBox(width: 5),
                        AutoSizeText(
                          'Free credit score',
                          style: TextStyle(fontFamily: StringRefer.Poppin, fontSize: 20, color: ColorRefer.kBorderColor,),
                        )
                      ],
                    ),
                    SizedBox(height:20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/svg/secure.svg', width: 30, height: 30,),
                        SizedBox(width: 5),
                        AutoSizeText(
                          'Your information is secured ',
                          style: TextStyle(fontFamily: StringRefer.Poppin, fontSize: 20, color: ColorRefer.kBorderColor,),
                        )
                      ],
                    ),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}

