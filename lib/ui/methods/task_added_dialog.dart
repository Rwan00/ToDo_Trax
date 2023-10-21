import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

import '../theme.dart';
import '../views/ongoing_view.dart';
import 'custom_container.dart';



void buildDialog(BuildContext context,
    {required String imgUrl, required String titleTxt, required String subTitleTxt}) {
  final AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    backgroundColor: context.theme.colorScheme.background,

    content: SizedBox(
      height: 350,
      child: Column(
        children: <Widget>[
          Image.asset(
            imgUrl,
            width: 192,
            height: 192,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(titleTxt,
              style: heading2.copyWith(
                  color: Get.isDarkMode
                      ? const Color.fromRGBO(255, 255, 255, 1)
                      : const Color.fromRGBO(35, 35, 35, 1))),
          const SizedBox(
            height: 12,
          ),
          Text(
            subTitleTxt,
            style: title.copyWith(
                color: const Color.fromRGBO(119, 119, 119, 1)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 42,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                    child: const Ongoing(),
                    type: PageTransitionType.fade,
                    duration: const Duration(milliseconds: 700),
                  ));
            },
            child: customContainer(text: "Back"),
          )
        ],
      ),
    ),
  );
  showDialog(
    context: context,
    builder: (BuildContext ctx) {
      return alert;
    },
    barrierDismissible: false,

    //barrierColor: Colors.orange.withOpacity(0.3)
  );
}


