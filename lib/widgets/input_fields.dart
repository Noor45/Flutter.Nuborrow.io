import 'package:flutter/material.dart';
import 'package:nuborrow/utils/colors.dart';
import '../utils/style.dart';

class InputField extends StatefulWidget {
  InputField(
      {this.label,
      this.controller,
      this.hintText,
      this.onChanged,
      this.validator,
      this.textInputType,
      this.maxLength});
  final TextEditingController controller;
  final TextInputType textInputType;
  final String hintText;
  final String label;
  final int maxLength;
  final Function onChanged;
  final Function validator;
  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: widget.textInputType,
      onChanged: widget.onChanged,
      maxLength: widget.maxLength,
      decoration: StyleRefer.kTextFieldDecoration.copyWith(
          hintText: widget.hintText,
          hintStyle: TextStyle(fontSize: 15, color: ColorRefer.kLabelColor)),
    );
  }
}
