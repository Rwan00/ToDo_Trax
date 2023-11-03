import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo_trax/ui/methods/show_dialog.dart';
import 'package:todo_trax/ui/methods/task_added_dialog.dart';

import '../../cubits/read_tasks_cubit/read_task_cubit.dart';
import '../../models/task.dart';
import '../theme.dart';
import '../views/ongoing_view.dart';
import '../widgets/ongoing_task_tile.dart';
import '../widgets/task_tile.dart';
import 'no_task_message.dart';

showYourTasks(DateTime myDate,List<Task> tasks) {
  return BlocBuilder<TasksCubit, TasksState>(builder: (context, state) {

    if (tasks.isEmpty) {
      print(tasks);
      return const NoTaskMsg();
    } else {
     // print(myDate.difference(DateFormat('MMMM d').parse(tasks[0].date!)).inDays % 7 );
      return RefreshIndicator(
        onRefresh: ()async { BlocProvider.of<TasksCubit>(context)
            .fetchAllTasks(); },
        child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (BuildContext context, int index) {
              if (tasks[index].repeat == 0 ||
                  tasks[index].date == DateFormat('MMMM d').format(myDate) ||
                  (tasks[index].repeat == 1 &&
                      myDate.difference(DateFormat('MMMM d').parse(tasks[index].date!)).inDays % 7 == 3) ||
                  (tasks[index].repeat == 2 &&
                      DateFormat('MMMM d').parse(tasks[index].date!).day ==
                          myDate.day)) {
                final item = tasks[index];
                return AnimationConfiguration.staggeredList(
                  duration: const Duration(milliseconds: 500),
                  position: index,
                  child: SlideAnimation(
                    horizontalOffset: 100,
                    child: FadeInAnimation(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, bottom: 8, right: 24),
                        child: Dismissible(
                          key: Key(item.title!),
                          confirmDismiss: (DismissDirection dir) async {
                            if (dir == DismissDirection.startToEnd) {
                              final bool result = await buildAlertDialog(
                                  context: context,
                                  title: 'Delete This Task',
                                  content:
                                      'Are You Sure You Want To Delete This Task?',
                                  onTap: () {
                                    tasks[index].delete();
                                    BlocProvider.of<TasksCubit>(context)
                                        .fetchAllTasks();
                                    Get.back();
                                    Navigator.pushReplacement(
                                        context,
                                        PageTransition(
                                          child: const Ongoing(),
                                          type: PageTransitionType.fade,
                                          duration: const Duration(milliseconds: 700),
                                        ));
                                  },
                                  q1: 'Delete',
                                  clr: Colors.red);
                              return result;
                            } else {
                              final bool result = await buildAlertDialog(
                                  context: context,
                                  title: 'Complete The Task',
                                  content:
                                      'Did You Complete This Task?',
                                  onTap: () {
                                    tasks[index].isCompleted = 1;
                                    tasks[index].save();
                                    Get.back();
                                    buildDialog(
                                      context,
                                      imgUrl: 'assets/images/congrats.gif',
                                      titleTxt: 'Congratulations',
                                      subTitleTxt:
                                          'You Successfully completed your task. It’s a great step for better life waiting for you.',
                                    );
                                    //Navigator.of(context).pop();
                                  },
                                  q1: 'Complete',
                                  clr: Colors.green);
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
                          child: TaskTile(task: tasks[index]),
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                return Container();
              }
            }),
      );
    }
  });
}
