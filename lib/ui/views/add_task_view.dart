import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo_trax/cubits/add_task_cubit.dart';
import 'package:todo_trax/ui/methods/add_task_body.dart';
import 'package:todo_trax/ui/theme.dart';
import 'package:todo_trax/ui/views/ongoing_view.dart';

import '../methods/task_added_dialog.dart';


class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  //bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      appBar: addTaskAppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child:  BlocConsumer<AddTaskCubit,AddTaskState>(
            listener: (BuildContext context, Object? state) {
              /*if(state is AddTaskLoading)
                {
                  isLoading = true;
                }*/
              if(state is AddTaskFailure)
                {
                  print("FAIL ${state.errorMsg}");
                }
              if(state is AddTaskSuccess)
                {
                  buildDialog(
                    context,
                    imgUrl: 'assets/images/done.gif',
                    titleTxt: 'Great Job',
                    subTitleTxt: 'Your Task was added Successfully',
                  );
                  //Get.back();
                }
            },
            builder: (BuildContext context, state) {
              return ModalProgressHUD(
                inAsyncCall: state is AddTaskLoading ? true : false,
                  child: const SingleChildScrollView(child: AddTaskBody())
              );
            },
            ),
      ),
    );
  }

  addTaskAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.colorScheme.background,
      title: Text(
        "Create New Task",
        style: heading2,
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pushReplacement(
              context,
              PageTransition(
                child: const Ongoing(),
                type: PageTransitionType.topToBottom,
                //alignment: Alignment.bottomLeft,
                duration: const Duration(milliseconds: 700),
              ));
        },
        color: const Color.fromRGBO(167, 167, 167, 1),
        icon: const Icon(
          Icons.clear_rounded,
          size: 32,
        ),
      ),
    );
  }
}
