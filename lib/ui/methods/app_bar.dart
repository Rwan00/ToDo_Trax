import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../services/theme_service.dart';
import '../theme.dart';
import '../widgets/custom_icon.dart';

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
        const SizedBox(
          width: 4,
        ),
        SvgPicture.asset(
          "assets/images/fluent_hand-wave.svg",
          height: 15,
        )
      ],
    ),
    actions: [
      GestureDetector(
        onTap: () => ThemeServices().switchTheme(),
        child: buildIcon(
            imgUrl: Get.isDarkMode
                ? "assets/images/mode-light.svg"
                : "assets/images/mode-dark.svg",
            containerClr: Get.isDarkMode
                ? const Color.fromRGBO(44, 44, 44, 1)
                : const Color.fromRGBO(250, 250, 250, 1),
            iconClr: Get.isDarkMode
                ? const Color.fromRGBO(255, 199, 0, 1)
                : const Color.fromRGBO(8, 33, 65, 1), p: 0),
      ),
      //SizedBox(width: 27,)
    ],
  );
}
