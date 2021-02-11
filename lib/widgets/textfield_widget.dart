import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final bool isSecureData;
  final Function onChanged;
  final Function validateFieldValue;

  TextFieldWidget({
    this.textEditingController,
    this.hintText,
    this.isSecureData,
    this.onChanged,
    this.validateFieldValue,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      obscureText: isSecureData,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9@#_]"))
      ],
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(width: 2),
            borderRadius: BorderRadius.all(Radius.circular(40))),
        hintText: hintText,
        contentPadding:
            new EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
        hintStyle: TextStyle(
          fontSize: 18,
        ),
      ),
      onChanged: onChanged,
      validator: validateFieldValue,
    );
  }
}
