import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../services/theme_service.dart';
import '../theme.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: context.theme.colorScheme.background,
    elevation: 0,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          width: 19,
        ),
        Text(
          "Hello Friend",
          style: title,
        ),
         const SizedBox(width: 4,),
         SvgPicture.asset(
             "assets/images/fluent_hand-wave.svg",
           height: 15,
         )
      ],
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27.0),
        child: Stack(children: [
          Center(
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Get.isDarkMode? const Color.fromRGBO(44, 44, 44, 1) : const Color.fromRGBO(250, 250, 250, 1),
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
                child: GestureDetector(
                  onTap: () => ThemeServices().switchTheme(),
                  child: SvgPicture.asset(
                      Get.isDarkMode?"assets/images/mode-light.svg": "assets/images/mode-dark.svg",
                    height: 18,
                    colorFilter: ColorFilter.mode(
                        Get.isDarkMode? const Color.fromRGBO(255, 199, 0, 1): const Color.fromRGBO(8, 33, 65, 1),
                        BlendMode.srcIn
                    ),
                  )
                ),
              ),
            ],
          ),
        ]),
      ),
      //SizedBox(width: 27,)
    ],
  );
}