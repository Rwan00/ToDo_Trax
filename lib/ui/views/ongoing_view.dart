import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo_trax/ui/views/your_tasks_view.dart';
import '../../cubits/read_tasks_cubit/read_task_cubit.dart';
import '../methods/app_bar.dart';
import '../methods/ongoing_body.dart';
import '../methods/show_ongoing_tasks.dart';
import '../theme.dart';
import '../widgets/custom_icon.dart';
import '../widgets/separator.dart';
import '../widgets/ongoing_task_tile.dart';
import 'add_task_view.dart';

class Ongoing extends StatelessWidget {
  const Ongoing({super.key});

  @override
  Widget build(BuildContext context) {


    return BlocProvider(
      create: (context) {
        debugPrint("Done");
        return TasksCubit();

      },
      child: Scaffold(
        backgroundColor: context.theme.colorScheme.background,
        appBar: buildAppBar(context),
        body:  OngoingBody(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(
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
      ),
    );
  }
}

