import 'package:flutter/material.dart';
import 'package:nuborrow/utils/colors.dart';
import 'package:nuborrow/utils/strings.dart';
import '../utils/style.dart';
import 'package:date_time_picker/date_time_picker.dart';

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


class DateTimeField extends StatefulWidget {
  DateTimeField(
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
  _DateTimeFieldState createState() => _DateTimeFieldState();
}

class _DateTimeFieldState extends State<DateTimeField> {
  @override
  Widget build(BuildContext context) {
    return DateTimePicker(
      type: DateTimePickerType.date,
      dateMask: 'd MMM, yyyy - hh:mm:ss a',
      use24HourFormat: false,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      controller: widget.controller,
      onChanged: widget.onChanged,
      maxLength: widget.maxLength,
      decoration: StyleRefer.kTextFieldDecoration.copyWith(
          hintText: widget.hintText,
          hintStyle: TextStyle(fontSize: 15, color: ColorRefer.kLabelColor)),
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