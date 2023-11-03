import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

import '../../models/task.dart';
import '../methods/task_added_dialog.dart';
import '../theme.dart';
import '../widgets/custom_button.dart';
import 'edit_task_view.dart';
import 'ongoing_view.dart';

class DescriptionView extends StatelessWidget {
  final Task task;
  const DescriptionView({required this.task,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: context.theme.colorScheme.background,
        leading: IconButton(
          onPressed: () {
            Get.back();
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
                      child:  EditTaskView(task: task,),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    task.title!,
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
                        task.date!,
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
                        "${task.startTime} - ${task.endTime}",
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
                        task.repeat == 0? "Daily" : task.repeat == 1? "Weekly" : task.repeat == 2? "Monthly":"None",
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
                      task.description!,
                      style: txtHint,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 430,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: MyButton("Save As Done", () {
                //Get.back();
                buildDialog(
                  context,
                  imgUrl: 'assets/images/congrats.gif',
                  titleTxt: 'Congratulations',
                  subTitleTxt: 'You Successfully completed your task. It’s a great step for better life waiting for you.',
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
