import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../models/task.dart';

part 'read_task_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksInitial());

  List<Task>? tasks;
  fetchAllTasks()
  {

       var tasksBox = Hive.box<Task>("notes_box");

        tasks = tasksBox.values.toList();
        print(tasks);
        emit(TasksSuccess());

  }
}
