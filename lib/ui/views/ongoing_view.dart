import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_trax/services/theme_service.dart';

import '../theme.dart';

class Ongoing extends StatelessWidget {
  const Ongoing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      appBar: AppBar(
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
            const Icon(
              Icons.waving_hand,
              color: Colors.yellow,
              size: 15,
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
                    color: Get.isDarkMode? const Color.fromRGBO(44, 44, 44, 1) : Colors.white,
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
                      child: Icon(
                        Get.isDarkMode
                            ? Icons.light_mode_outlined
                            : Icons.dark_mode_outlined,
                        color: Get.isDarkMode ? Colors.yellow : Colors.black,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
          //SizedBox(width: 27,)
        ],
      ),
    );
  }
}
