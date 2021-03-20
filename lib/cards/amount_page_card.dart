import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:nuborrow/utils/colors.dart';
import 'package:nuborrow/utils/style.dart';
import 'package:nuborrow/widgets/input_fields.dart';
import 'package:nuborrow/widgets/round_button.dart';
import '../utils/strings.dart';

class LabelCard extends StatelessWidget {
  LabelCard({this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      label,
      style: TextStyle(
          fontSize: 18,
          fontFamily: StringRefer.SegoeUI,
          fontWeight: FontWeight.bold,
          color: Colors.black),
      softWrap: true,
      maxLines: 3,
      overflow: TextOverflow.visible,
    );
  }
}

class TextFieldCard extends StatefulWidget {
  TextFieldCard(
      {this.textInputType,
        this.label,
        this.hint,
        this.value,
        this.onChanged,
        this.onPressed,
        this.showButton
      });

  final String label;
  final String value;
  final String hint;
  final Function onChanged;
  final TextInputType textInputType;
  final Function onPressed;
  final bool showButton;

  @override
  _TextFieldCardState createState() => _TextFieldCardState();
}

class _TextFieldCardState extends State<TextFieldCard> {
  TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width > 900 ? width / 2 : width,
      child: Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Wrap(
          direction: width > 1100 ? Axis.horizontal :  width >  650 ?  Axis.horizontal :  Axis.vertical,
          children: [
            Container(
              width: width > 1100 ? width / 5 : width > 650 ? width / 2.5 : width,
              child: LabelCard(
                label: widget.label,
              ),
            ),
            SizedBox(height: 20, width: 50,),
            Container(
              width: width > 1100 ? width / 5 :  width > 650 ? width/2.5  : width/1.1,
              child: Wrap(
                direction: Axis.horizontal,
                children: [
                  InputField(
                    hintText: widget.hint,
                    controller: textEditingController,
                    onChanged: widget.onChanged,
                    textInputType: widget.textInputType,
                  ),
                  Visibility(
                    visible: widget.showButton,
                    child: Wrap(
                      direction: Axis.horizontal,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Container(
                            width: width > 1100 ? width / 5 :  width > 650 ? width/2.5  : width/1.1,
                            child: RoundedButton(
                              title: 'continue',
                              textColor: Colors.white,
                              height: 60,
                              colour: Color(0xff705aa7),
                              buttonRadius: 10,
                              onPressed: widget.onPressed,
                            ),
                          ),
                        ),
                      ],
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

class DateTimeFieldCard extends StatefulWidget {
  DateTimeFieldCard(
      {this.label,
      this.hint,
      this.onTab,
      this.showButton,
      this.onPressed,
      this.controller});
  final String label;
  final String hint;
  final Function onTab;
  final bool showButton;
  final TextEditingController controller;
  final Function onPressed;
  @override
  _DateTimeFieldCardState createState() => _DateTimeFieldCardState();
}

class _DateTimeFieldCardState extends State<DateTimeFieldCard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width > 900 ? width / 2 : width,
      child: Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Wrap(
          direction: width > 1100 ? Axis.horizontal : width > 650 ? Axis.horizontal : Axis.vertical,
          children: [
            Container(
              width: width > 1100 ? width / 5 : width > 650 ? width / 2.5 : width,
              child: LabelCard(
                label: widget.label,
              ),
            ),
            SizedBox(height: 20, width: 50),
            Container(
              width: width > 1100 ? width / 5 :  width > 650 ? width/2.5  : width/1.1,
              child: Wrap(
                direction: Axis.horizontal,
                children: [
                  DateTimeField(
                    controller: widget.controller,
                    hintText: widget.hint,
                    onTab: widget.onTab,
                  ),
                  Visibility(
                    visible: widget.showButton,
                    child: Wrap(
                      direction: Axis.horizontal,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Container(
                            width: width > 1100 ? width / 5 :  width > 650 ? width/2.5  : width/1.1,
                            child: RoundedButton(
                              title: 'continue',
                              textColor: Colors.white,
                              height: 60,
                              colour: Color(0xff705aa7),
                              buttonRadius: 10,
                              onPressed: widget.onPressed,
                            ),
                          ),
                        ),
                      ],
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

class PriceCard extends StatefulWidget {
  PriceCard({this.title, this.value, this.color});

  final String title;
  final String value;
  final Color color;

  @override
  _PriceCardState createState() => _PriceCardState();
}

class _PriceCardState extends State<PriceCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 50, right: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: AutoSizeText(
              widget.title,
              maxLines: 3,
              softWrap: true,
              overflow: TextOverflow.visible,
              style: TextStyle(
                  fontFamily: StringRefer.SegoeUI,
                  fontSize: 18,
                  color: widget.color),
            ),
          ),
          AutoSizeText(
            widget.value,
            style: TextStyle(
                fontFamily: StringRefer.SegoeUI,
                fontSize: 18,
                color: widget.color),
          ),
        ],
      ),
    );
  }
}



class TabCard extends StatefulWidget {
  TabCard({this.title, this.labelColor, this.textColor});

  final String title;
  final Color textColor;
  final Color labelColor;

  @override
  _TabCardState createState() => _TabCardState();
}

class _TabCardState extends State<TabCard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      child: Container(
        width: width > 1100 ? width / 5 : width > 650 ? width / 2.5 : width / 1.1,
        height: 50,
        decoration:
        StyleRefer.kTabDecoration.copyWith(color: widget.labelColor),
        child: Center(
          child: Text(
            widget.title,
            style: TextStyle(
                fontFamily: StringRefer.Poppins, color: widget.textColor),
          ),
        ),
      ),
    );
  }
}