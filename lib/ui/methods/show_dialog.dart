import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme.dart';

Future<dynamic> buildAlertDialog(
    {required BuildContext context,
    required String title,
    required String content,
    required Function() onTap,
    required String q1,
      required Color clr,
    }) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  final AlertDialog alert = AlertDialog(
    backgroundColor: context.theme.colorScheme.background,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    contentTextStyle: txtDes1.copyWith(fontSize: 16),
    title: Text(
      title,
      style: heading,
    ),
    content: SizedBox(
      height: height * 0.15,
      child: Column(
        children: <Widget>[
          const Divider(
            color: Colors.grey,
          ),
          Text(content),
           SizedBox(height: height * 0.022,),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                       MaterialStatePropertyAll(clr),
                      shape:
                      MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: onTap,
                    child: Text(
                      q1,
                      style: GoogleFonts.roboto(color: Colors.white),
                    )),
              ),
              SizedBox(
                width: width*0.035,
              ),
              Expanded(
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStatePropertyAll(Get.isDarkMode? dPrimaryClr:primaryClr),
                      shape:
                      MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      "Cancel",
                      style: GoogleFonts.lato(color: Colors.white),
                    )),
              ),
            ],
          ),
        ],
      ),
    ),
  );
  return showDialog(
    context: context,
    builder: (BuildContext ctx) {
      return alert;
    },
    barrierDismissible: false,
    //barrierColor: Colors.orange.withOpacity(0.3)
  );

}
