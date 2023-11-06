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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
            width: width*0.08,
            height: height*0.05,
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
                   SizedBox(
                    height: height*0.035,
                  ),
                  Text(
                    task.title!,
                    style: txtDes1,
                  ),
                   SizedBox(
                    height: height*0.02,
                  ),
                  Row(
                    children: [
                      Text(
                        "Due Date",
                        style: txtHint,
                      ),
                       SizedBox(
                        width: width*0.06,
                      ),
                      Text(
                        task.date!,
                        style: txtHint.copyWith(fontSize: 10),
                      )
                    ],
                  ),
                   SizedBox(
                    height: height*0.02,
                  ),
                  Row(
                    children: [
                      Text(
                        "Time",
                        style: txtHint,
                      ),
                       SizedBox(
                        width: width*0.08,
                      ),
                      Text(
                        "${task.startTime} - ${task.endTime}",
                        style: txtHint.copyWith(fontSize: 10),
                      )
                    ],
                  ),
                   SizedBox(
                    height: height*0.02,
                  ),
                  Row(
                    children: [
                      Text(
                        "Repeat",
                        style: txtHint,
                      ),
                       SizedBox(
                        width: width*0.08,
                      ),
                      Text(
                        task.repeat == 0? "Daily" : task.repeat == 1? "Weekly" : task.repeat == 2? "Monthly":"None",
                        style: txtHint.copyWith(fontSize: 10),
                      )
                    ],
                  ),
                   SizedBox(
                    height: height*0.03,
                  ),
                  Text(
                    "Description",
                    style: txtOngoing2,
                  ),
                   SizedBox(
                    height: height*0.02,
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
                task.isCompleted = 1;
                task.save();
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
