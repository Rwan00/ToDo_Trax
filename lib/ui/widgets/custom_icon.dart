import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../services/theme_service.dart';

Padding buildIcon({required String imgUrl, required Color containerClr,required Color iconClr,required double p}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 27.0),
    child: Stack(children: [
      Center(
        child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: containerClr,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
      Row(
        children: [
          const SizedBox(
            width: 6,
          ),
          Center(
            child: Padding(
              padding:  EdgeInsets.only(top: p),
              child: SvgPicture.asset(
                imgUrl,
                height: 18,
                colorFilter: ColorFilter.mode(
                    iconClr,
                    BlendMode.srcIn
                ),
              ),
            ),
          ),
        ],
      ),
    ]),
  );
}