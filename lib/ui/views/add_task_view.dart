import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_trax/ui/theme.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: context.theme.colorScheme.background,
        title: Text(
          "Create New Task",
          style: heading2,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          color: const Color.fromRGBO(167, 167, 167, 1),
          icon: const Icon(Icons.clear_rounded,size: 32,),
        ),
      ),
    );
  }
}
