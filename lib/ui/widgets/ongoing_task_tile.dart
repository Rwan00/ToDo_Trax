import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_trax/ui/theme.dart';

import '../../models/task.dart';

class OngoingTaskTile extends StatelessWidget {
  final Task task;

  const OngoingTaskTile({required this.task, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: const EdgeInsets.symmetric(vertical: 25),
      height: 95,
      //margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffBFBFBF), width: 0.3),
        borderRadius: BorderRadius.circular(8),
        color:
            Get.isDarkMode ? const Color.fromRGBO(44, 44, 44, 1) : Colors.white,
      ),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
            children: <Widget>[
              const SizedBox(
                height: 7,
              ),
              Text(
                task.title!,
                style: heading,
              ),
              const SizedBox(
                height: 6.5,
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
              const SizedBox(
                height: 5.5,
              ),
              Row(
                children: <Widget>[
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Due Date :  ${task.date}",
                    style: subHeading,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            width: 110,
          ),
          Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 7),
              child: Container(
                width: 40,
                height: 19,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Get.isDarkMode
                        ? const Color.fromRGBO(169, 169, 169, 1)
                        : const Color.fromRGBO(242, 237, 237, 1)),
                child: Center(
                  child: Text(
                    task.repeat == 0
                        ? "Daily"
                        : task.repeat == 1
                            ? "Weekly"
                            : task.repeat == 2
                                ? "Monthly"
                                : "None",
                    style: subHeading.copyWith(color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              task.isCompleted == 0 ? "To DO" : "Completed",
              style: subHeading.copyWith(
                  color: const Color.fromRGBO(20, 99, 0, 1)),
            ),
            //const SizedBox(height: 16,),
          ])
        ],
      ),
    );
  }
}
