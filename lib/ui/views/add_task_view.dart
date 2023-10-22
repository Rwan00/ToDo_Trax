import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo_trax/ui/theme.dart';
import 'package:todo_trax/ui/views/ongoing_view.dart';

import '../methods/custom_container.dart';
import '../methods/task_added_dialog.dart';
import '../widgets/custom_button.dart';
import '../widgets/input_field.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  bool isSwitched = false;

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
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    "Schedule",
                    style: headingAddTask,
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Text(
                          "12 October",
                          style: headingAddTask.copyWith(fontSize: 12),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          size: 15,
                          color: Color.fromRGBO(119, 119, 119, 1),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              const InputField(title: 'Title'),
              InputField(
                title: 'Purpose',
                widget: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    size: 20,
                    color: Color.fromRGBO(119, 119, 119, 1),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: InputField(
                      title: 'Start Time',
                      widget: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.access_time_rounded,
                          size: 20,
                          color: Color.fromRGBO(119, 119, 119, 1),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 28,
                  ),
                  Expanded(
                    child: InputField(
                      title: 'End Time',
                      widget: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.access_time_rounded,
                          size: 20,
                          color: Color.fromRGBO(119, 119, 119, 1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    "Priority",
                    style: headingAddTask.copyWith(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(child: customContainer(text: "Low")),
                      Expanded(child: customContainer(text: "Medium")),
                      Expanded(child: customContainer(text: "High")),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              const InputField(title: 'Description'),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Reminder",
                    style: headingAddTask.copyWith(fontSize: 16),
                  ),
                  const Spacer(),
                  Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                      });
                    },
                    inactiveThumbColor:
                        Get.isDarkMode ? dSecondaryClr : secondaryClr,
                    inactiveTrackColor: Colors.grey,
                    activeColor: Get.isDarkMode ? dPrimaryClr : primaryClr,
                  ),
                ],
              ),
              const SizedBox(
                height: 70,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: MyButton("Create Task", () {
                  buildDialog(
                    context,
                    imgUrl: 'assets/images/done.gif',
                    titleTxt: 'Great Job',
                    subTitleTxt: 'Your Task was added Successfully',
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
