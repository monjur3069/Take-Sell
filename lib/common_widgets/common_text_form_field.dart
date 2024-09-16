


import 'package:flutter/material.dart';
import 'package:take_sell/utils/constants.dart';

class CommonTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? radius;
  final String? password;
  final bool? isEmail;
  final int? maxLine;
  final Color? textColor;
  final Color? borderColor;
  final bool? validatorEnable;
  final Function(String)? onSubmit;
  final Icon? prefixIcon;
  final Icon? suffixIcon;

  const CommonTextFormField(
      {this.verticalPadding,
      this.keyboardType,
      required this.hintText,
      required this.controller,
      super.key,
      this.password,
      this.isEmail,
      this.maxLine,
      this.horizontalPadding,
      this.radius,
      this.textColor,
      this.onSubmit,
      this.validatorEnable, this.prefixIcon, this.suffixIcon, this.borderColor});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onSubmit ?? (v) {},
      textInputAction: TextInputAction.done,
      maxLines: maxLine ?? 1,
      // cursorHeight: 10,
      clipBehavior: Clip.none,
      cursorColor: Colors.black45,
      style: TextStyle(
          color: textColor ?? Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w400),
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 0),
            borderSide: BorderSide(color: Colors.blueGrey.shade100, width: 2)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              radius ?? 0,
            ),
            borderSide: BorderSide(color: borderColor ?? Colors.blueGrey.shade50, )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              radius ?? 0,
            ),
            borderSide: const BorderSide(color: Colors.red)),
        contentPadding: EdgeInsets.symmetric(
            vertical: verticalPadding ?? 25,
            horizontal: horizontalPadding ?? 20),
        fillColor: primaryWhite,
        filled: true,
        hintStyle: const TextStyle(color: primaryGrey, fontSize: 13),
        hintText: hintText,
        border: InputBorder.none,

        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon


      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field must not be empty';
        }
        return null;
      },
    );
  }
}

