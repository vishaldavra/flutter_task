import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_constant.dart';


class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.none,
    this.validator,
    this.onChanged,
    this.enabled = true,
    this.maxLength,
    this.maxLines,
    this.label,
    this.inputFormatters,
    this.counterText,
    this.textCapitalization = TextCapitalization.words,
  });

  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final TextEditingController controller;
  final String? counterText;
  final bool? enabled;
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType keyboardType;
  final String? label;
  final int? maxLength;
  final int? maxLines;
  final TextCapitalization textCapitalization;

  @override
  Widget build(BuildContext context) {
    Brightness currentBrightness = MediaQuery.of(context).platformBrightness;
    return Container(
      decoration: BoxDecoration(
        color:  ( currentBrightness == Brightness.dark)? Theme.of(context).hintColor.withOpacity(0.1) : Colors.grey.withOpacity(0.6),

        borderRadius: BorderRadius.circular(15.0),
      ),
      child: TextFormField(

        maxLength: maxLength,
        maxLines: maxLines,
        enabled: enabled,
        controller: controller,
        keyboardType: keyboardType,
        textCapitalization: textCapitalization,
        cursorColor: ( currentBrightness == Brightness.dark)? Theme.of(context).hintColor :appTheme.itemShadowColorLight,
         style: TextStyle(
        color:( currentBrightness == Brightness.dark)? Colors.white70 : Colors.white,

        fontSize: 20, // Optional: Set other text style attributes
      ),
        decoration: InputDecoration(

          filled: false,

          counterText: "",
          hintText: hintText,
          hintStyle:TextStyle(
        color:( currentBrightness == Brightness.dark)? Theme.of(context).hintColor.withOpacity(0.3) :  Colors.white70,
        fontSize: 18.0, // Optional: Set other text style attributes
      ),
          label: label != null ? Text(label!) : null,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),

            borderSide: BorderSide(
              color: ( currentBrightness == Brightness.dark)? Theme.of(context).hintColor : Colors.black,
              width: 5.0,
            ),
          ),

        ),
        validator: validator,
        onChanged: onChanged,
        inputFormatters: inputFormatters,
      ),
    );
  }
}



class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final IconData? icon;
  final bool obscureText;
  final bool? readOnly;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final VoidCallback? onTap;

  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.hintText,

    this.icon,
    this.onTap,
    this.readOnly,
    this.obscureText = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.onFieldSubmitted,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap??(){},
      child: TextFormField(
        readOnly: readOnly??false,
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        onFieldSubmitted: onFieldSubmitted,
        validator: validator,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
        //  labelText: labelText,
          hintText: hintText,
          prefixIcon: icon != null ? Icon(icon) : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}