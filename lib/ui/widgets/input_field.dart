import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_trax/ui/theme.dart';

class InputField extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  final Widget? widget;

  const InputField(
      {required this.title, this.controller, this.widget, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: headingAddTask.copyWith(fontSize: 16),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 45,
              ),
              child: TextFormField(
                maxLines: null,
                controller: controller,
                autofocus: false,
                readOnly: widget != null ? true : false,
                style: headingAddTask.copyWith(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 16,
                ),
                cursorColor: Get.isDarkMode ? dPrimaryClr : primaryClr,
                decoration: InputDecoration(
                  suffixIcon: widget,
                  contentPadding: const EdgeInsets.only(left: 10, top: 10),
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(98, 98, 98, 1), width: 1)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: widget != null
                            ? const Color.fromRGBO(98, 98, 98, 1)
                            : Get.isDarkMode
                                ? dSecondaryClr
                                : primaryClr,
                        width: 1),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
