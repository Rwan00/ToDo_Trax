import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme.dart';

class MyButton extends StatelessWidget {
  final String label;
  final Function() onTap;
  final Color? clr;

  const MyButton(this.label, this.onTap, {this.clr,this.isLoading = false, super.key});

  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 312,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: clr,
        ),
        child: isLoading?  SizedBox(
          height: 20,
          width: 15,
          child: CircularProgressIndicator(
            color: Get.isDarkMode? dPrimaryClr: primaryClr,
          ),
        ):Text(
          label,
          style: GoogleFonts.roboto(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
