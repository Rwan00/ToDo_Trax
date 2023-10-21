import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme.dart';

Padding customContainer({required String text,color}) {
  return Padding(
    padding: const EdgeInsets.only(left: 16.0),
    child: Container(
      width: 175,
      height: 38,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
              color: const Color.fromRGBO(98, 98, 98, 1))),
      child: Center(
        child: Text(
          text,
          style: subHeading.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode? const Color.fromRGBO(166, 166, 166, 1) : const Color.fromRGBO(98, 98, 98, 1)),
        ),
      ),
    ),
  );
}