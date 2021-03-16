import 'package:flutter/material.dart';
import '../utils/strings.dart';

class RoundedButton extends StatefulWidget {
  RoundedButton(
      {this.title, this.colour, @required this.onPressed, this.buttonRadius, this.textColor, this.height});

  final Color colour;
  final String title;
  final Color textColor;
  final double height;
  final Function onPressed;
  final double buttonRadius;
  @override
  _RoundedButtonState createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  @override
  Widget build(BuildContext context) {
     widget.textColor==null ?? Colors.black;
    return Material(
      elevation: 5.0,
      color: widget.colour,
      borderRadius: BorderRadius.circular(widget.buttonRadius),
      child: MaterialButton(
        onPressed: widget.onPressed,
        minWidth: MediaQuery.of(context).size.width / 4,
        height: widget.height,
        child: Text(
          widget.title,
          style: TextStyle(
              color: widget.textColor, fontFamily: StringRefer.PoppinMedium),
        ),
      ),
    );
  }
}


class RateButton extends StatefulWidget {
  RateButton(
      {this.title, this.colour, @required this.onPressed, this.buttonRadius, this.textColor, this.height, this.font});

  final Color colour;
  final String title;
  final Color textColor;
  final double height;
  final Function onPressed;
  final double font;
  final double buttonRadius;
  @override
  _RateButtonState createState() => _RateButtonState();
}

class _RateButtonState extends State<RateButton> {
  @override
  Widget build(BuildContext context) {
    widget.textColor==null ?? Colors.black;
    return Material(
      elevation: 5.0,
      color: widget.colour,
      borderRadius: BorderRadius.circular(widget.buttonRadius),
      child: MaterialButton(
        onPressed: widget.onPressed,
        minWidth: MediaQuery.of(context).size.width / 4,
        height: widget.height,
        child: Text(
          widget.title,
          style: TextStyle(
              color: widget.textColor, fontFamily: StringRefer.PoppinMedium, fontSize: widget.font),
            textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
