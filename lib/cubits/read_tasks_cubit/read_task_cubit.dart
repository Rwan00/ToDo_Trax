import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../models/task.dart';

part 'read_task_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksInitial());

  fetchAllTasks() async
  {
    try{
      var tasksBox = Hive.box<Task>("notes_box");

   var tasks = tasksBox.values.toList();
      emit(TasksSuccess(tasks));
    }
    catch(e)
    {
      //isLoading= false;
      emit(TasksFailure(e.toString()));
    }
  }
}
