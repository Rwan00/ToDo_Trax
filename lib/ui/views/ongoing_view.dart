import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import '../methods/app_bar.dart';
import '../methods/show_ongoing_tasks.dart';
import '../methods/task_added_dialog.dart';
import '../widgets/task_tile.dart';
import 'add_task_view.dart';


class Ongoing extends StatelessWidget {
  const Ongoing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      appBar: buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            showOngoingTasks(TaskTile()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              PageTransition(
                child: const AddTaskView(),
                type: PageTransitionType.bottomToTop,
                alignment: Alignment.bottomLeft,
                duration: const Duration(milliseconds: 700),
              ));
        },
        backgroundColor: context.theme.colorScheme.primary,
        child: const Icon(
          Icons.add,
          size: 32,
        ),
      ),
    );
  }
}
