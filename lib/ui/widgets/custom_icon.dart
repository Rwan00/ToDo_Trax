import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../services/theme_service.dart';

Padding buildIcon({required BuildContext context,required String imgUrl, required Color containerClr,required Color iconClr,required double p}) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 27.0),
    child: Stack(children: [
      Center(
        child: Container(
          height: height*0.035,
          width: width*0.07,
          decoration: BoxDecoration(
            color: containerClr,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
      Row(
        children: [
          const SizedBox(
            width: 5,
          ),
          Center(
            child: Padding(
              padding:  EdgeInsets.only(top: p),
              child: SvgPicture.asset(
                imgUrl,
                height: height*0.023,
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