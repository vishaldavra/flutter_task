import 'package:flutter/material.dart';

import '../constants/color_constant.dart';

TextFormField getTextField({
  String? hintText,
  String? labelText,
  TextEditingController? textEditingController,
  Widget? prefixIcon,
  double? borderRadius,
  Widget? suffixIcon,
  double? size = 100,
  Widget? suffix,
  Color? borderColor,
  Color? fillColor,
  Color? cursorColor,
  bool isFilled = false,
  Color? labelColor,
  TextInputType textInputType = TextInputType.name,
  TextInputAction textInputAction = TextInputAction.next,
  bool textVisible = false,
  bool readOnly = false,
  VoidCallback? onTap,
  int maxLine = 1,
  int? maxLength,
  String errorText = "",
  // Function(String)? onChange,
  FormFieldValidator<String>? validation,
  double? fontSize,
  double hintFontSize = 14,
  bool inlineBorder = false,
  double? topPadding,
  double? borderWidth = 1,
  double? leftPadding,
  FocusNode? focusNode,
  void Function(String)? onChanged,
  TextCapitalization textCapitalization = TextCapitalization.none,
}) {
  return TextFormField(
    controller: textEditingController,
    obscureText: textVisible,
    textInputAction: textInputAction,
    keyboardType: textInputType,
    focusNode: focusNode,
    textCapitalization: textCapitalization,
    cursorColor: cursorColor ?? appTheme.primaryTheme,
    readOnly: readOnly,
    validator: validation,
    onTap: onTap,
    maxLines: maxLine,
    onChanged: onChanged,
    
    style: TextStyle(
      fontSize: fontSize ?? 15,
    ),
    maxLength: maxLength ?? null,
    decoration: InputDecoration(
      errorStyle: TextStyle(color: appTheme.fromHex("FFFF6464")),
      fillColor: fillColor ?? appTheme.textGrayColor,
      // isDense: inlineBorder,
      filled: isFilled,
      labelText: labelText,
      labelStyle: TextStyle(
          color: labelColor ?? appTheme.primaryTheme,
          fontWeight: FontWeight.w600),

      enabledBorder: (inlineBorder)
          ? UnderlineInputBorder(
              borderSide: BorderSide(
                  width: borderWidth ?? 1,
                  color: borderColor ?? Color(0xff262626).withOpacity(0.5)))
          : OutlineInputBorder(
              borderSide: BorderSide(
                  width: borderWidth ?? 1,
                  color: borderColor ?? appTheme.primaryTheme),
              borderRadius: BorderRadius.circular(
                  (borderRadius == null) ? 5 : borderRadius),
            ),
      focusedBorder: (inlineBorder)
          ? UnderlineInputBorder(
              borderSide: BorderSide(
                  width: borderWidth ?? 1,
                  color: borderColor ?? Color(0xff262626).withOpacity(0.5)))
          : OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                  (borderRadius == null) ? 5 : borderRadius),
              borderSide: BorderSide(
                  width: borderWidth ?? 1,
                  color: borderColor ?? appTheme.primaryTheme),
            ),
      errorBorder: (inlineBorder)
          ? UnderlineInputBorder(
              borderSide: BorderSide(
                  width: borderWidth ?? 1,
                  color: borderColor ?? Color(0xff262626).withOpacity(0.5)))
          : OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                  (borderRadius == null) ? 5 : borderRadius),
              borderSide: BorderSide(
                  width: borderWidth ?? 1,
                  color: borderColor ?? appTheme.primaryTheme),
            ),
      border: (inlineBorder)
          ? UnderlineInputBorder(
              borderSide: BorderSide(
                  width: borderWidth ?? 1,
                  color: borderColor ?? Color(0xff262626).withOpacity(0.5)))
          : OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                  (borderRadius == null) ? 5 : borderRadius),
            ),
      contentPadding: EdgeInsets.only(
        left: (inlineBorder) ? -30 : 20,
        right: 10,
        bottom: (inlineBorder) ? 0 : size! / 3.5, //
        top: (inlineBorder) ? topPadding ?? 0 : 0, // HERE THE IMPORTANT PART
      ),
      prefixIconConstraints:
          inlineBorder ? BoxConstraints(minWidth: leftPadding ?? 0) : null,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      suffix: suffix,
      errorMaxLines: 2,
      errorText: (isNullEmptyOrFalse(errorText)) ? null : errorText,
      hintText: hintText,
      hintStyle: TextStyle(fontSize: hintFontSize, color: Colors.grey.shade500),
    ),
  );
}

Container getTextField2({
  String? hintText,
  String? labelText,
  TextEditingController? textEditingController,
  Widget? prefixIcon,
  double? borderRadius,
  Widget? suffixIcon,
  double? size = 100,
  Widget? suffix,
  Color? borderColor,
  Color? textColor,
  Color? fillColor,
  Color? cursorColor,
  bool isFilled = false,
  Color? labelColor,
  TextInputType textInputType = TextInputType.name,
  TextInputAction textInputAction = TextInputAction.next,
  bool textVisible = false,
  bool readOnly = false,
  VoidCallback? onTap,
  int maxLine = 1,
  int? maxLength,
  String errorText = "",
  // Function(String)? onChange,
  FormFieldValidator<String>? validation,
  double? fontSize,
  double hintFontSize = 14,
  double? topPadding,
  double? borderWidth = 1,
  double? leftPadding,
  FocusNode? focusNode,
  void Function(String)? onChanged,
  TextCapitalization textCapitalization = TextCapitalization.none,
}) {
  return Container(

    decoration: BoxDecoration(
        color: fillColor,
      borderRadius: BorderRadius.circular(10)
    ),
    child: TextFormField(

      controller: textEditingController,
      obscureText: textVisible,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      focusNode: focusNode,
      textCapitalization: textCapitalization,
      cursorColor: cursorColor ?? appTheme.primaryTheme,
      readOnly: readOnly,
      validator: validation,
      onTap: onTap,
      maxLines: maxLine,
      onChanged: onChanged,
      style: TextStyle(
        fontSize: fontSize ?? 15,
        color: textColor??Colors.black
      ),
      maxLength: maxLength ?? null,
      decoration: InputDecoration(
        border: InputBorder.none,
        fillColor: Colors.transparent,
        // isDense: inlineBorder,
        filled: isFilled,
        labelText: labelText,
        labelStyle: TextStyle(
            color: labelColor ?? appTheme.primaryTheme,
            fontWeight: FontWeight.w600),
        contentPadding: EdgeInsets.only(
          left: 20,
          right: 10,
          bottom: 3.5, //
          top:suffixIcon!=null? 5:0, // HERE THE IMPORTANT PART
        ),

        // prefixIconConstraints:
        // inlineBorder ? BoxConstraints(minWidth: leftPadding ?? 0) : null,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        suffix: suffix,
        errorMaxLines: 2,
        errorText: (isNullEmptyOrFalse(errorText)) ? null : errorText,
        hintText: hintText,
        errorStyle: TextStyle(color: appTheme.fromHex("FFFF6464")),
        hintStyle: TextStyle(fontSize: hintFontSize, color: Colors.grey.shade500),
      ),
    ),
  );
}

Widget getUnderLineTextBox({
  required TextEditingController textController,
  FormFieldValidator<String>? validation,
  String? hintText,
  Widget? prefix,
  TextInputType textInputType = TextInputType.text,
  TextInputAction textInputAction = TextInputAction.next,
  VoidCallback? onTap,
  bool readOnly = false,
  Color? borderColor,
  Widget? suffix,
  FocusNode? focusNode,
  Widget? suffixIcon,
  double? size,
  required double height,
  required double width,
  void Function(String)? onChanged,
  double? topPadding,
  double? leftPadding,
}) {
  return Container(
    height: height,
    width: width,
    child: getTextField(
      inlineBorder: true,
      textEditingController: textController,
      textInputAction: textInputAction,
      focusNode: focusNode,
      fillColor: Colors.transparent,
      size: size,
      textInputType: textInputType,
      hintText: hintText,
      borderColor: borderColor,
      prefixIcon: (isNullEmptyOrFalse(prefix)) ? SizedBox() : prefix,
      validation: validation,
      onTap: onTap,
      suffix: suffix,
      suffixIcon: suffixIcon,
      readOnly: readOnly,
      onChanged: onChanged,
      topPadding: topPadding,
      leftPadding: leftPadding,
    ),
  );
}
