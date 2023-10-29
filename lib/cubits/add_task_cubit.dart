import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../models/task.dart';

part "add_task_state.dart";
class AddTaskCubit extends Cubit<AddTaskState>
{
  AddTaskCubit(super.initialState);

  addTask(Task task) async
  {
    emit(AddTaskLoading());
    try{
      var tasksBox = Hive.box("notes_box");
      emit(AddTaskSuccess());
      await tasksBox.add(task);
    }
    catch(e)
    {
      AddTaskFailure(e.toString());
    }

  }

}