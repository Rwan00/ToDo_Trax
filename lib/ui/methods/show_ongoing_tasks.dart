import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_trax/cubits/read_tasks_cubit/read_task_cubit.dart';
import 'package:todo_trax/ui/methods/show_dialog.dart';

import '../../models/task.dart';
import '../theme.dart';
import '../widgets/ongoing_task_tile.dart';

showOngoingTasks() {
  return BlocBuilder<TasksCubit, TasksState>(builder: (context, state) {
    List<Task> tasks = BlocProvider.of<TasksCubit>(context).tasks ?? [];
    if (tasks.isEmpty) {
      print(tasks);
      return _noTaskMsg();
    } else {
      return ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (BuildContext context, int index) {
            final item = tasks[index];
            return AnimationConfiguration.staggeredList(
              duration: const Duration(milliseconds: 500),
              position: index,
              child: SlideAnimation(
                horizontalOffset: 100,
                child: FadeInAnimation(
                  child: GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 8.0, bottom: 8, right: 24),
                      child: Dismissible(
                          key: Key(item.title!),
                          confirmDismiss: (DismissDirection dir) async {
                            if (dir == DismissDirection.startToEnd) {
                              final bool result = await buildDialog(
                                context: context,
                                title: 'Delete ${item.title} Task',
                                content: 'Are You Sure You Want To Delete ${item.title} Task?',
                                onTap: () {
                                  Get.back();
                                },
                                q1: 'Delete',
                                clr: Colors.red
                              );
                              return result;
                            } else {
                              final bool result = await buildDialog(
                                context: context,
                                title: 'Complete ${item.title} Task',
                                content: 'Did You Complete ${item.title} Task?',
                                onTap: () {
                                  tasks[index].isCompleted = 1;
                                  Get.back();
                                },
                                q1: 'Complete',
                                clr: Colors.green
                              );
                              return result;
                            }
                          },
                          background: Container(
                            height: 95,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color(0xffBFBFBF), width: 0.3),
                                borderRadius: BorderRadius.circular(8),
                                color: const Color.fromRGBO(169, 30, 0, 1)),
                            child: Align(
                              alignment: const Alignment(-0.9, 0),
                              child: Text(
                                "Canceled",
                                style: txtDis,
                              ),
                            ),
                          ),
                          secondaryBackground: Container(
                            height: 95,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color(0xffBFBFBF), width: 0.3),
                                borderRadius: BorderRadius.circular(8),
                                color: const Color.fromRGBO(0, 169, 37, 1)),
                            child: Align(
                              alignment: const Alignment(0.9, 0),
                              child: Text(
                                "Completed",
                                style: txtDis,
                              ),
                            ),
                          ),
                          child: OngoingTaskTile(task: tasks[index])),
                    ),
                  ),
                ),
              ),
            );
          });
    }
  });
}

_noTaskMsg() {
  return Stack(
    children: <Widget>[
      AnimatedPositioned(
        duration: const Duration(milliseconds: 2000),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 150,
              ),
              /*Image.asset(
                "assets/images/noData.png",
                height: 150,
                width: 250,
              ),*/
              SvgPicture.asset(
                "assets/images/noData.svg",
                height: 160,
                width: 210,
                semanticsLabel: "Task",
                colorFilter: const ColorFilter.mode(
                    Color.fromRGBO(26, 115, 233, 1), BlendMode.dst),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Text(
                  "No Tasks Found",
                  style: txtOngoing3,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 180,
              ),
            ],
          ),
        ),
      )
    ],
  );
}
