import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../models/task.dart';

part 'add_task_state.dart';
class AddTaskCubit extends Cubit<AddTaskState>
{
  AddTaskCubit() : super(AddTaskInitial());

  //bool isLoading = false;
  addTask(Task task) async
  {
    //isLoading = true;
    emit(AddTaskLoading());
    try{
      var tasksBox = Hive.box<Task>("notes_box");
      //isLoading = false;

      await tasksBox.add(task);
      emit(AddTaskSuccess());
    }
    catch(e)
    {
      //isLoading= false;
      emit(AddTaskFailure(e.toString()));
    }

  }

}