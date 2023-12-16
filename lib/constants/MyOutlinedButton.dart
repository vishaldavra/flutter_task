
import 'package:flutter/material.dart';
import 'package:flutter_task/constants/sizeConstant.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';


import 'color_constant.dart';


class MyOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final ButtonStyle? style;
  final Gradient? gradient;
  final double thickness;

  const MyOutlinedButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.style,
    this.gradient,
    this.thickness = 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return  GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Container(
          width: MySize.safeWidth,
          height: MySize.getHeight(60),
          decoration: BoxDecoration(
              border:  GradientBoxBorder(

                gradient: LinearGradient(colors: [appTheme.fromHex("#008f96"),appTheme.fromHex("#00c1c9"),appTheme.fromHex("#00e4d9")],begin: Alignment.bottomCenter,end: Alignment.topCenter),
                width: 3,
              ),
              borderRadius: BorderRadius.circular(12)
          ),
          child: child,
        ),
      ),
    );
  }
}