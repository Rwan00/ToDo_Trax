import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryClr = Color.fromRGBO(104, 126, 255, 1);
const secondaryClr = Color.fromRGBO(182, 255, 250, 1);
const dPrimaryClr = Color.fromRGBO(4, 54, 74, 1);
const dSecondaryClr = Color.fromRGBO(23, 107, 135, 1);
const myPurple = Color.fromRGBO(147, 119, 205, 1);
const myOrange = Color.fromRGBO(222, 138, 40, 1);

class Themes {
  static final light = ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: primaryClr,
          secondary: secondaryClr,
          background: Colors.white,
          brightness: Brightness.light));
  static final dark = ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: dPrimaryClr,
          secondary: dSecondaryClr,
          background: Colors.black,
          brightness: Brightness.dark));
}

TextStyle get title {
  return GoogleFonts.roboto(
      textStyle: TextStyle(
    fontSize: 15,
    color: Get.isDarkMode ? Colors.white : Colors.black,
  ));
}

TextStyle get heading {
  return GoogleFonts.roboto(
      textStyle: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 24,
    color:
        Get.isDarkMode ? const Color.fromRGBO(202, 202, 202, 1) : Colors.black,
  ));
}
TextStyle get subHeading {
  return GoogleFonts.roboto(
      textStyle: const TextStyle(
    fontSize: 10,
    color:
         Color.fromRGBO(119, 119, 119, 1) ,
  ));
}
TextStyle get heading2 {
  return GoogleFonts.roboto(
      textStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
        color:
        Get.isDarkMode ? const Color.fromRGBO(255, 255, 255, 1) : const Color
            .fromRGBO(98, 98, 98, 1),
      ));
}

TextStyle get headingAddTask {
  return GoogleFonts.roboto(
      textStyle: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 20,
        color: Color.fromRGBO(119, 119, 119, 1),
      ));
}
TextStyle get headingOngoing {
  return GoogleFonts.roboto(
      textStyle:  TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 32,
        color: Get.isDarkMode? const Color.fromRGBO(255, 255, 255, 1): const Color.fromRGBO(72, 72, 72, 1),
      ));
}
TextStyle get txtOngoing1 {
  return GoogleFonts.roboto(
      textStyle:  TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: Get.isDarkMode? const Color.fromRGBO(166, 166, 166, 1): const Color.fromRGBO(106, 106, 106, 1),
      ));
}
TextStyle get txtOngoing2 {
  return GoogleFonts.roboto(
      textStyle:  TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 24,
        color: Get.isDarkMode? const Color.fromRGBO(227, 227, 227, 1): const Color.fromRGBO(64, 64, 64, 1),
      ));
}
TextStyle get txtOngoing3 {
  return GoogleFonts.roboto(
      textStyle:  const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color:  Color.fromRGBO(209, 209, 209, 1),
      ));
}
TextStyle get txtHint {
  return GoogleFonts.roboto(
      textStyle:   TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: Get.isDarkMode? const Color.fromRGBO(119, 119, 119, 1):const Color.fromRGBO(95, 94, 94, 1),
      ));
}
TextStyle get txtTask1 {
  return GoogleFonts.roboto(
      textStyle:   TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 20,
        color: Get.isDarkMode? const Color.fromRGBO(174, 174, 174, 1):const Color.fromRGBO(98, 98, 98, 1),
      ));
}
TextStyle get txtTask2 {
  return GoogleFonts.roboto(
      textStyle:   const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 8,
        color:  Color.fromRGBO(174, 174, 174, 1),
      ));
}
TextStyle get txtTask3 {
  return GoogleFonts.roboto(
      textStyle:   const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 10,
        color:  Color.fromRGBO(98, 98, 98, 1),
      ));
}
TextStyle get txtDes1 {
  return GoogleFonts.roboto(
      textStyle:    TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 24,
        color:  Get.isDarkMode? const Color.fromRGBO(255, 255, 255, 1) : const Color.fromRGBO(61, 61, 63, 1),
      ));
}
