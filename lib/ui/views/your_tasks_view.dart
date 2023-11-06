import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo_trax/ui/views/description_view.dart';

import '../../cubits/read_tasks_cubit/read_task_cubit.dart';
import '../methods/show_ongoing_tasks.dart';
import '../methods/your_tasks_body.dart';
import '../theme.dart';
import '../widgets/separator.dart';
import '../widgets/ongoing_task_tile.dart';
import '../widgets/task_tile.dart';
import 'add_task_view.dart';
import 'ongoing_view.dart';

class YourTasks extends StatefulWidget {
  const YourTasks({super.key});

  @override
  State<YourTasks> createState() => _YourTasksState();
}

class _YourTasksState extends State<YourTasks> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
        create: (context) {
          debugPrint("Done2");
          return TasksCubit();
        },
      child: Scaffold(
        backgroundColor: context.theme.colorScheme.background,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: context.theme.colorScheme.background,
          title: Text(
            "Your Tasks",
            style: heading2,
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            color: const Color.fromRGBO(167, 167, 167, 1),
            icon: Container(
              width: width*0.08,
              height: height*0.05,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color.fromRGBO(167, 167, 167, 1))),
              child: const Icon(
                Icons.arrow_back,
                size: 24,
              ),
            ),
          ),
        ),
        body: const YourTasksBody(),
      ),
    );
  }

}
