import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:temancurhat/shared/styles/styles.dart';

class InputTextWidget extends StatelessWidget {
  final String name;
  final TextEditingController controller;
  final Function(String) validator;
  final String hintText;
  final bool obscureText;
  final IconData iconData;
  final TextInputType textInputType;
  final TextInputAction textInputAction;

  const InputTextWidget({
    Key key,
    this.name,
    @required this.controller,
    this.validator,
    this.hintText = "",
    this.obscureText = false,
    this.iconData,
    this.textInputType,
    this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      textAlign: TextAlign.start,
      obscureText: obscureText,
      validator: validator,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: MyColors.grey),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.white,
        filled: true,
        errorStyle: TextStyle(color: Colors.white),
        prefixIcon: Icon(iconData, color: MyColors.blue),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.2,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.2,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      controller: controller,
    );
  }
}
