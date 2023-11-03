import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo_trax/ui/views/your_tasks_view.dart';

import '../../cubits/read_tasks_cubit/read_task_cubit.dart';
import '../../models/task.dart';
import '../methods/custom_container.dart';
import '../methods/edit_view_body.dart';
import '../theme.dart';
import '../widgets/custom_button.dart';
import '../widgets/input_field.dart';

class EditTaskView extends StatefulWidget {
  final Task task;
  const EditTaskView({required this.task,super.key});

  @override
  State<EditTaskView> createState() => _EditTaskViewState();
}

class _EditTaskViewState extends State<EditTaskView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: context.theme.colorScheme.background,
        title: Text(
          "Edit Task",
          style: heading2,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          color: const Color.fromRGBO(167, 167, 167, 1),
          icon: const Icon(
            Icons.clear_rounded,
            size: 24,
          ),
        ),
      ),
      body: EditViewBody(task: widget.task,),
    );
  }


}
