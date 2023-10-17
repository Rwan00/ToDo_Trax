import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryClr = Color.fromRGBO(104, 126, 255,1);
const secondaryClr = Color.fromRGBO(182, 255, 250,1);
const dPrimaryClr = Color.fromRGBO(4, 54, 74,1);
const dSecondaryClr = Color.fromRGBO(23, 107, 135,1);

class Themes {
  static final light = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: primaryClr,
      secondary: secondaryClr,
      background: Colors.white,
      brightness: Brightness.light
    )
  );
  static final dark = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: dPrimaryClr,
      secondary: dSecondaryClr,
      background: Colors.black,
      brightness: Brightness.dark
    )
  );

}

TextStyle get title{
return GoogleFonts.roboto(
  textStyle: TextStyle(
    fontSize: 15,
    color: Get.isDarkMode? Colors.white:Colors.black,
  )
);
}
