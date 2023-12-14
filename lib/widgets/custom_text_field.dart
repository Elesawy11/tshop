import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/constant.dart';
import 'package:shop_app/helper_method.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.onChanged,
    this.hintText,
    this.prefixIcon,
    this.obscureText = false,
    this.suffixIcon,
    this.onFieldSubmitted,
    this.label,
    this.validator,
    this.keyboardType,
    this.width,
    this.textAlign = TextAlign.start,
    this.maxLength,
    this.height,
    this.style,
    this.inputFormatters,
  });
  final void Function(String)? onChanged;
  final String? hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final String? label;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final double? width;
  final double? height;
  final TextAlign textAlign;
  final int? maxLength;
  final TextStyle? style;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        inputFormatters: inputFormatters,
        style: style,
        // autofocus: true,
        textAlign: textAlign,

        onFieldSubmitted: onFieldSubmitted,
        obscureText: obscureText,
        validator: validator,
        onChanged: onChanged,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 42.w,
            vertical: 16.h,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: label,
          labelStyle: TextStyle(
            fontSize: 17.sp,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: kSecondaryColor,
          ),
          suffixIcon: Icon(
            suffixIcon,
            color: kSecondaryColor,
          ),
          enabledBorder: borderDecoration(),
          focusedBorder: borderDecoration(),
          border: borderDecoration(),
        ),
      ),
    );
  }

  
}
