import 'package:flutter/material.dart';
import 'package:nuborrow/utils/colors.dart';
import 'package:nuborrow/utils/strings.dart';
import '../utils/style.dart';
import 'package:intl/intl.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart' as dp;

// import 'package:date_time_picker/date_time_picker.dart';

class InputField extends StatefulWidget {
  InputField(
      {this.label,
      this.controller,
      this.hintText,
      this.onChanged,
      this.validator,
      this.readOnly,
      this.textInputType,
      this.maxLength});
  final TextEditingController controller;
  final TextInputType textInputType;
  final String hintText;
  final String label;
  final bool readOnly;
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
      readOnly: widget.readOnly,
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


class DateTimeField extends StatefulWidget {
  DateTimeField(
      {this.label,
        this.controller,
        this.hintText,
        this.onTab,
        this.validator,
        this.maxLength});
  final TextEditingController controller;
  final String hintText;
  final String label;
  final int maxLength;
  final Function onTab;
  final Function validator;
  @override
  _DateTimeFieldState createState() => _DateTimeFieldState();
}

class _DateTimeFieldState extends State<DateTimeField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      readOnly: true,
      // onChanged: widget.onChanged,
      maxLength: widget.maxLength,
      decoration: StyleRefer.kTextFieldDecoration.copyWith(
          hintText: widget.hintText,
          hintStyle: TextStyle(fontSize: 15, color: ColorRefer.kLabelColor)),
      onTap: widget.onTab,
    );
  }
}

class SelectField extends StatefulWidget {
  SelectField({
    this.hintText,
    this.onChanged,
    this.selectionList,
    this.value
  });
  final List<String> selectionList;
  final Function onChanged;
  final String value;
  final String hintText;


  @override
  _SelectFieldState createState() => _SelectFieldState();
}

class _SelectFieldState extends State<SelectField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: StyleRefer.kTabDecoration.copyWith(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: DropdownButton<String>(
          value: widget.value,
          hint: Text(widget.hintText, style: TextStyle(fontSize: 15, color: ColorRefer.kLabelColor),),
          icon: Icon(Icons.keyboard_arrow_down),
          isExpanded: true,
          style: TextStyle( fontFamily: StringRefer.SFProDisplay),
          underline: Container(
            height: 2,
            color: Colors.white,
          ),
          onChanged: widget.onChanged,
          items: widget.selectionList
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}