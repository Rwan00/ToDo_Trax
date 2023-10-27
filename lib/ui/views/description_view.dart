import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

import '../methods/task_added_dialog.dart';
import '../theme.dart';
import '../widgets/custom_button.dart';
import 'edit_task_view.dart';
import 'ongoing_view.dart';

class DescriptionView extends StatelessWidget {
  const DescriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: context.theme.colorScheme.background,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                PageTransition(
                  child: const Ongoing(),
                  type: PageTransitionType.leftToRight,
                  //alignment: Alignment.bottomLeft,
                  duration: const Duration(milliseconds: 700),
                ));
          },
          color: const Color.fromRGBO(167, 167, 167, 1),
          icon: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border:
                    Border.all(color: const Color.fromRGBO(167, 167, 167, 1))),
            child: const Icon(
              Icons.arrow_back,
              size: 24,
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                      child: const EditTaskView(),
                      type: PageTransitionType.rightToLeft,
                      //alignment: Alignment.bottomLeft,
                      duration: const Duration(milliseconds: 700),
                    ));
              },
              icon: const Icon(
                Icons.edit_outlined,
                size: 24,
                color: Color.fromRGBO(119, 119, 119, 1),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              "Go To Gym",
              style: txtDes1,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Text(
                  "Due Date",
                  style: txtHint,
                ),
                const SizedBox(
                  width: 30,
                ),
                Text(
                  "October 25",
                  style: txtHint.copyWith(fontSize: 10),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Text(
                  "Time",
                  style: txtHint,
                ),
                const SizedBox(
                  width: 30,
                ),
                Text(
                  "10 : 00 Am - 06 : 00 Pm",
                  style: txtHint.copyWith(fontSize: 10),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Text(
                  "Repeat",
                  style: txtHint,
                ),
                const SizedBox(
                  width: 30,
                ),
                Text(
                  "Daily",
                  style: txtHint.copyWith(fontSize: 10),
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              "Description",
              style: txtOngoing2,
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Text(
                "Lorem ipsum dolor sit amet consectetur. In commodo nunc donec nunc luctus ornare. Eget nulla eu hac ac. Blandit dolor feugiat sodales eu pulvinar nulla. Vel libero mattis arcu aliquam molestie. Cursus vestibulum urna vel ornare amet diam. Lorem ipsum dolor sit amet consectetur. In commodo nunc donec nunc luctus ornare. Eget nulla eu hac ac. Blandit dolor feugiat sodales eu pulvinar nulla. Vel libero mattis arcu aliquam molestie. Cursus vestibulum urna vel ornare amet diam.",
                style: txtHint,
              ),
            ),
            const SizedBox(
              height: 380,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: MyButton("Save As Done", () {
                buildDialog(
                  context,
                  imgUrl: 'assets/images/congrats.gif',
                  titleTxt: 'Congratulations',
                  subTitleTxt: 'You Successfully completed your task. It’s agreat step for better life waiting for you.',
                );
              },
                clr: Get.isDarkMode? dPrimaryClr:primaryClr,
              ),
            )
          ],
        ),
      ),
    );
  }
}
