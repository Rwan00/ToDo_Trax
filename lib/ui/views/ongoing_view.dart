import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo_trax/ui/theme.dart';

import '../methods/app_bar.dart';
import '../methods/show_ongoing_tasks.dart';
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
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return SizedBox(
                  height: 400,
                  child: Container(
                    color: context.theme.colorScheme.background,
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          "assets/images/done.gif",
                          width: 192,
                          height: 192,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text("Great Job", style: heading2),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          "Your Task was added Successfully",
                          style: title,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 42,
                        ),
                        ElevatedButton(

                            onPressed: () {
                              Get.back();
                            },
                            child: Text("Back",style: heading2,))
                      ],
                    ),
                  ),
                );
              });

          /*Navigator.push(
              context,
              PageTransition(
                child: const AddTaskView(),
                type: PageTransitionType.bottomToTop,
                alignment: Alignment.bottomLeft,
                duration: const Duration(milliseconds: 700),
              ));*/
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
