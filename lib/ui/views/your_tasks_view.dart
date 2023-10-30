import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo_trax/ui/views/description_view.dart';

import '../methods/show_ongoing_tasks.dart';
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
  DateTime myDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Navigator.pushReplacement(
                context,
                PageTransition(
                  child: const Ongoing(),
                  type: PageTransitionType.leftToRight,
                  //alignment: Alignment.bottomLeft,
                  duration: const Duration(milliseconds: 700),
                ));
          },
          color: const Color.fromRGBO(167, 167, 167, 1),
          icon: Container(
            width: 35,
            height: 35,
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
      body: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30.0, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        DateFormat('MMMM y').format(myDate),
                        style: txtTask1,
                      ),
                      IconButton(
                          onPressed: () => _getDateFromUser(),
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            size: 24,
                            color: Color.fromRGBO(119, 119, 119, 1),
                          ))
                    ],
                  ),
                  Text(
                    "3 Tasks This Day",
                    style: txtTask3,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _addDateBar(),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            separator(),
            const SizedBox(
              height: 20,
            ),
            showOngoingTasks(
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        PageTransition(
                          child: const DescriptionView(),
                          type: PageTransitionType.rightToLeft,
                          //alignment: Alignment.bottomLeft,
                          duration: const Duration(milliseconds: 700),
                        ));
                  },
                child: const TaskTile(),
            ),
            ),
          ],
        ),
      ),
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
    );
  }

  _getDateFromUser() async {
    DateTime? _pickedDate = await showDatePicker(
      context: context,
      initialDate: myDate,
      firstDate: DateTime(2015),
      lastDate: DateTime(2030),
    );
    if (_pickedDate != null) {
      setState(() {
        myDate = _pickedDate;
      });
    } else {
      print("IT'S NULL OR SOMETHING IS WRONG!!");
    }
  }

  _addDateBar() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromRGBO(174, 174, 174, 1)),
          borderRadius: BorderRadius.circular(8)),
      child: DatePicker(
        DateTime.now(),
        initialSelectedDate: myDate,
        width: 44,
        height: 58,
        selectedTextColor: Colors.white,
        selectionColor: Get.isDarkMode ? dPrimaryClr : primaryClr,
        deactivatedColor: Get.isDarkMode ? Colors.white : Colors.black,
        monthTextStyle: txtTask2,
        dateTextStyle: txtTask2,
        dayTextStyle: txtTask2,
        onDateChange: (newDate) {
          setState(() {
            myDate = newDate;
          });
        },
      ),
    );
  }
}
