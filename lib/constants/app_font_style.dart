
import 'package:flutter/material.dart';

class AppFontStyle{

  static TextStyle titleAppBarStyle(Color color, {num textSize}) {
      return TextStyle(
        color: color,
        fontSize: 18,
        fontWeight: FontWeight.w300,
        fontFamily: "Poppins"
      );
  }

  static TextStyle buttonTextStyle(Color color, {num textSize}) {
    return TextStyle(
        color: color,
        fontSize: textSize!= null?textSize:12,
        fontWeight: FontWeight.w300,
        fontFamily: "Poppins"
    );
  }

  static TextStyle bodyTextStyle(Color color, {num textSize}) {
    return TextStyle(
        color: color,
        fontSize: 12,
        fontWeight: FontWeight.w300,
        fontFamily: "Poppins"
    );
  }

  static TextStyle bodyTextStyle2(Color color, {num textSize}) {
    return TextStyle(
        color: color,
        fontSize: 14,
        fontWeight: FontWeight.w300,
        fontFamily: "Poppins"
    );
  }

  static TextStyle ultraTextStyle(Color color, {num textSize}) {
    return TextStyle(
        color: color,
        fontSize: 36,
        fontWeight: FontWeight.w500,
        fontFamily: "Poppins"
    );
  }

  static TextStyle headingTextStyle(Color color, {num textSize}) {
    return TextStyle(
        color: color,
        fontSize: 18,
        fontWeight: FontWeight.w500,
        fontFamily: "Poppins"
    );
  }

  static TextStyle regularTextStyle(Color color, {num textSize}) {
    return TextStyle(
        color: color,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: "Poppins"
    );
  }

  static TextStyle regularTextStyle2(Color color, {num textSize}) {
    return TextStyle(
        color: color,
        fontSize: 16,
        fontWeight: FontWeight.w300,
        fontFamily: "Poppins"
    );
  }

  static TextStyle regularTextStyle3(Color color, {num textSize}) {
    return TextStyle(
        color: color,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: "Poppins"
    );
  }

  static TextStyle regularTextStyle4(Color color, {num textSize}) {
    return TextStyle(
        color: color,
        fontSize: 12,
        fontWeight: FontWeight.w300,
        fontFamily: "Poppins"
    );
  }

  static TextStyle regularHeadingTextStyle(Color color, {num textSize}) {
    return TextStyle(
        color: color,
        fontSize: 24,
        fontWeight: FontWeight.w800,
        fontFamily: "Poppins"
    );
  }

  static TextStyle regularSmallTextStyle(Color color, {num textSize}) {
    return TextStyle(
        color: color,
        fontSize: 20,
        fontWeight: FontWeight.w800,
        fontFamily: "Poppins"
    );
  }

  static TextStyle labelTextStyle(Color color, {num textSize}) {
    return TextStyle(
        color: color,
        fontSize: 16,
        fontWeight: FontWeight.w200,
        fontFamily: "Poppins"
    );
  }

}