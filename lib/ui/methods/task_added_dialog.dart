import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

import '../theme.dart';
import '../views/ongoing_view.dart';
import 'custom_container.dart';

void buildDialog(BuildContext context,
    {required String imgUrl,
    required String titleTxt,
    required String subTitleTxt}) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  final AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    backgroundColor: context.theme.colorScheme.background,
    content: SizedBox(
      height: height*0.45,
      child: Column(
        children: <Widget>[
          Image.asset(
            imgUrl,
            width: width*0.5,
            height: height*0.25,
          ),
           SizedBox(
            height: height*0.02,
          ),
          Text(
            titleTxt,
            style: heading2.copyWith(
              color: Get.isDarkMode
                  ? const Color.fromRGBO(255, 255, 255, 1)
                  : const Color.fromRGBO(35, 35, 35, 1),
            ),
          ),
           SizedBox(
            height: height*0.01,
          ),
          Text(
            subTitleTxt,
            style: title.copyWith(
              color: const Color.fromRGBO(119, 119, 119, 1),
            ),
            textAlign: TextAlign.center,
          ),
           SizedBox(
            height: height*0.04,
          ),
          GestureDetector(
            onTap: () async{
              Get.back();
             await Navigator.pushReplacement(
                 context,
                 PageTransition(
                   child: const Ongoing(),
                   type: PageTransitionType.fade,
                   duration: const Duration(milliseconds: 700),
                 ));

            },
            child: customContainer(context:context,text: "Back"),
          )
        ],
      ),
    ),
  );
  showDialog(
    context: context,
    builder: (_) {
      return alert;
    },
    barrierDismissible: false,

    //barrierColor: Colors.orange.withOpacity(0.3)
  );
}
