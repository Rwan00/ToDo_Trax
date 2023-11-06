import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo_trax/ui/views/edit_task_view.dart';

import '../../models/task.dart';
import '../theme.dart';
import '../views/description_view.dart';
import 'custom_icon.dart';

class TaskTile extends StatelessWidget {
  final Task task;

  const TaskTile({required this.task, super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
              child:  DescriptionView(task: task,),
              type: PageTransitionType.rightToLeft,
              //alignment: Alignment.bottomLeft,
              duration: const Duration(milliseconds: 700),
            ));
      },
      child: Container(
        //padding: const EdgeInsets.symmetric(vertical: 25),
        height: height*0.09,
        //margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffBFBFBF), width: 0.3),
          borderRadius: BorderRadius.circular(8),
          color: Get.isDarkMode
              ? const Color.fromRGBO(44, 44, 44, 1)
              : Colors.white,
        ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CircleAvatar(
                backgroundColor: task.purpose == 0
                    ? myPurple
                    : task.purpose == 1
                        ? myGreen
                        : task.purpose == 2
                            ? myRed
                            : task.purpose == 3
                                ? myOrange
                                : task.purpose == 4
                                    ? myPink
                                    : task.purpose == 5
                                        ? myYellow
                                        : task.purpose == 6
                                            ? myGrey
                                            : task.purpose == 7
                                                ? myTeal
                                                : myBlue,
                radius: 20,
                child: Center(
                  child: Icon(
                    task.purpose == 0
                        ? Icons.work
                        : task.purpose == 1
                            ? Icons.person
                            : task.purpose == 2
                                ? Icons.health_and_safety
                                : task.purpose == 3
                                    ? Icons.school
                                    : task.purpose == 4
                                        ? Icons.family_restroom
                                        : task.purpose == 5
                                            ? Icons.fitness_center
                                            : task.purpose == 6
                                                ? Icons.mode_of_travel
                                                : task.purpose == 7
                                                    ? Icons.shopping_cart
                                                    : Icons.smart_toy_outlined,
                    size: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                 SizedBox(
                  height: height*0.01,
                ),
                Text(
                  task.title!,
                  style: taskTileH,
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: <Widget>[
                    const Icon(
                      Icons.access_time_rounded,
                      color: Color.fromRGBO(119, 119, 119, 1),
                      size: 12,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      "${task.startTime} - ${task.endTime}",
                      style: subHeading,
                    ),
                  ],
                ),
              ],
            ),
             SizedBox(
              width: width*0.3,
            ),
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
              icon: SvgPicture.asset(
                "assets/images/editIcon.svg",
                height: height*0.03,
                colorFilter: const ColorFilter.mode(
                    Color.fromRGBO(119, 119, 119, 1),
                    BlendMode.srcIn
                ),
              ),),
          ],
        ),
      ),
    );
  }
}
