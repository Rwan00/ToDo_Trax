import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo_trax/ui/views/edit_task_view.dart';

import '../theme.dart';

class TaskTile extends StatefulWidget {
  const TaskTile({super.key});

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: const EdgeInsets.symmetric(vertical: 25),
      height: 90,
      //margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffBFBFBF), width: 0.3),
        borderRadius: BorderRadius.circular(8),
        color:
            Get.isDarkMode ? const Color.fromRGBO(44, 44, 44, 1) : Colors.white,
      ),
      child: Row(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: CircleAvatar(
              backgroundColor: myPurple,
              radius: 20,
              child: Center(
                child: Icon(
                  Icons.fitness_center,
                  size: 17,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Column(
            children: <Widget>[
              const SizedBox(
                height: 16,
              ),
              Text(
                "Go to Gym",
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
                    "10 : 00 Am - 06 : 00 Pm",
                    style: subHeading,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            width: 125,
          ),
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
    );
  }
}
