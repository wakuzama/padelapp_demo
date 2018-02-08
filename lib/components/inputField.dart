import 'package:flutter/material.dart';
//import 'package:flutter/src/services/text_formatter.dart';

class InputField extends StatelessWidget {
  final IconData icon;
  final String hintText, labelText, initialValue;
  final TextInputType textInputType;
  final Color textFieldColor, iconColor, textColor;
  final bool obscureText;
  final double bottomMargin;
  final TextStyle textStyle,hintStyle;
  final validateFunction;
  final onSaved;
  final Key key;
  final TextEditingController controller;
  final List inputFormatters;

  //passing props in the Constructor.
  //Java like style
  InputField({
    this.key,
    this.hintText,
    this.labelText,
    this.initialValue,
    this.obscureText,
    this.textInputType,
    this.textFieldColor,
    this.icon,
    this.iconColor,
    this.textColor,
    this.bottomMargin,
    this.textStyle,
    this.validateFunction,
    this.onSaved,
    this.hintStyle,
    this.controller,
    this.inputFormatters
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (new Container(
        margin: new EdgeInsets.only(bottom: bottomMargin),
        child: new DecoratedBox(
          decoration: new BoxDecoration(
              borderRadius: new BorderRadius.all(new Radius.circular(12.0)),
              color: textFieldColor),
          child: new TextFormField(
            style: textStyle,
            key: key,
            obscureText: obscureText,
            keyboardType: textInputType,
            validator: validateFunction,
            controller: controller,
            initialValue: initialValue,
            onSaved: onSaved, maxLines: 1,
            inputFormatters: inputFormatters,
            decoration: new InputDecoration(
                hintText: hintText,
                labelText: labelText,
                hintStyle: hintStyle,
                icon: new Icon(
                  icon,
                  color: iconColor,
                ),
//                hideDivider: true
            ),
          ),
        )));
  }
}