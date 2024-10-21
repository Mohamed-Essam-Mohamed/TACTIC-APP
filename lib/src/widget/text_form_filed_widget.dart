// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, curly_braces_in_flow_control_structures, prefer_typing_uninitialized_variables, camel_case_types, prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tactic_zone/src/utils/app_color.dart';
import 'package:tactic_zone/src/utils/app_text_style.dart';

class TextFormFiledWidget extends StatefulWidget {
  final String hintText;
  bool? isObscureText;
  bool? showObscureText = false;
  final String? Function(String?)? validator;

  final TextEditingController? controller;
  final EdgeInsetsGeometry? contentPadding;
  final keyboardtype;
  final Color? colorHintText;
  final double? fontSizeStyle;

  TextFormFiledWidget({
    this.isObscureText = false,
    required this.hintText,
    this.showObscureText,
    required this.validator,
    this.keyboardtype = TextInputType.name,
    this.contentPadding,
    required this.controller,
    this.fontSizeStyle,
    this.colorHintText,
  });

  @override
  State<TextFormFiledWidget> createState() => _TextFormFiledWidgetState();
}

class _TextFormFiledWidgetState extends State<TextFormFiledWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isObscureText!,
      validator: widget.validator,
      keyboardType: widget.keyboardtype,
      controller: widget.controller,
      style: AppTextStyle.textStyle20.copyWith(fontSize: widget.fontSizeStyle),
      decoration: InputDecoration(
        fillColor: AppColor.withColor,
        filled: true,
        contentPadding: widget.contentPadding == null
            ? EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h)
            : widget.contentPadding,
        hintText: widget.hintText,
        hintStyle:
            AppTextStyle.textStyle20.copyWith(color: widget.colorHintText),
        errorStyle: AppTextStyle.textStyle20.copyWith(
          color: AppColor.redColor,
          fontSize: 14,
          height: 0,
        ),
        errorMaxLines: 1,
        suffixIcon: widget.showObscureText == true ? logicIcon() : null,
        enabledBorder: customOutLineInputBorder(color: Colors.transparent),
        errorBorder: customOutLineInputBorder(color: AppColor.redColor),
        focusedBorder: customOutLineInputBorder(color: AppColor.primaryColor),
        focusedErrorBorder: customOutLineInputBorder(color: AppColor.redColor),
      ),
    );
  }

  OutlineInputBorder customOutLineInputBorder({required Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(50.r),
      borderSide: BorderSide(
        color: color,
        width: 1.5.w,
      ),
    );
  }

  Widget logicIcon() {
    return InkWell(
      onTap: () {
        if (widget.isObscureText!) {
          widget.isObscureText = false;
        } else {
          widget.isObscureText = true;
        }
        setState(() {});
      },
      child: widget.isObscureText == false
          ? Icon(
              Icons.visibility,
              size: 23.sp,
            )
          : Icon(
              Icons.visibility_off,
              size: 23.sp,
            ),
    );
  }
}
