import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:todo_trax/ui/methods/show_dialog.dart';
import 'package:todo_trax/ui/methods/task_added_dialog.dart';

import '../../cubits/read_tasks_cubit/read_task_cubit.dart';
import '../../models/task.dart';
import '../theme.dart';
import '../widgets/ongoing_task_tile.dart';
import '../widgets/task_tile.dart';
import 'no_task_message.dart';

showYourTasks() {
  return BlocBuilder<TasksCubit, TasksState>(builder: (context, state) {
    List<Task> tasks = BlocProvider.of<TasksCubit>(context).tasks ?? [];
    if (tasks.isEmpty) {
      print(tasks);
      return const NoTaskMsg();
    } else {
      return ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              duration: const Duration(milliseconds: 500),
              position: index,
              child: SlideAnimation(
                horizontalOffset: 100,
                child: FadeInAnimation(
                  child: Padding(
                    padding:
                    const EdgeInsets.only(top: 8.0, bottom: 8, right: 24),
                    child: TaskTile(task: tasks[index]),
                  ),
                ),
              ),
            );
          });
    }
  });
}