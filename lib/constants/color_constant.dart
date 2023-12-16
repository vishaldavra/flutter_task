import 'package:flutter/material.dart';
class BaseTheme {
  Color get primaryTheme => fromHex('#632DBE');

  Color get buttonColor => fromHex('#FE9013');

  Color get textGrayColor => fromHex("#5E5E5E");
  Color get textTitleColor => fromHex("#F7EFE5");
  Color get bgColor => fromHex("#ede9e3");
  Color get fillColor => fromHex("#C9222027");
//Dark Theme
  Color get textTitleColorDark => fromHex("#7c7c7c");
  Color get itemShadowColorDark => fromHex("#EA80FC");
  Color get itemColorDark => Colors.grey.shade900;

  //Light Theme
  Color get textTitleColorLight => Colors.white70;
  Color get itemShadowColorLight => Colors.white;
  Color get itemColorLight => Colors.indigoAccent;

  Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  LinearGradient wel_g1() {
    return LinearGradient(
      begin: Alignment(0.00, -1.00),
      end: Alignment(0, 1),
      colors: [Color(0xFF632DBE), Color(0xFF251148)],
    );
  }

  LinearGradient wel_g2() {
    return LinearGradient(
      begin: Alignment(0.00, -1.00),
      end: Alignment(0, 1),
      colors: [Color(0xFF7D9E), Color(0xFF8AA5)],
    );
  }
}


const NextButtonIcon = 'assets/images/NextRoundBtn.png';
const RegButtonIcon = 'assets/images/reg.png';
const DoneIcon = 'assets/images/done_icon.png';
const ErrorIcon = 'assets/images/errorIcon.png';

BaseTheme get appTheme => BaseTheme();
bool isNullEmptyOrFalse(dynamic o) {
  if (o is Map<String, dynamic> || o is List<dynamic>) {
    return o == null || o.length == 0;
  }
  return o == null || false == o || "" == o;
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}