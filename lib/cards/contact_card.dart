import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';
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
        this.onChanged,
        this.showButton,
        this.onPressed,
        this.inputFormatters,
        this.controller,
      });
  final TextEditingController controller;
  final String label;
  final String hint;
  final Function onChanged;
  final TextInputType textInputType;
  final bool showButton;
  final Function onPressed;
  final List<TextInputFormatter> inputFormatters;
  @override
  _TextFieldCardState createState() => _TextFieldCardState();
}

class _TextFieldCardState extends State<TextFieldCard> {
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
            SizedBox(height: 20, width: 50),
            Container(
              width: width > 1100 ? width / 5 :  width > 650 ? width/2.5  : width/1.1,
              child: Wrap(
                direction: Axis.horizontal,
                children: [
                  InputField(
                    controller: widget.controller,
                    readOnly: false,
                    hintText: widget.hint,
                    formatter: widget.inputFormatters,
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
                              title: 'Yes, show me my rates  ',
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