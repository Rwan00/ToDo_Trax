import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_trax/ui/methods/show_your_tasks.dart';

import '../../cubits/read_tasks_cubit/read_task_cubit.dart';
import '../theme.dart';
import '../widgets/separator.dart';

class YourTasksBody extends StatefulWidget {
  const YourTasksBody({super.key});

  @override
  State<YourTasksBody> createState() => _YourTasksBodyState();
}

class _YourTasksBodyState extends State<YourTasksBody> {
  @override
  void initState() {
    BlocProvider.of<TasksCubit>(context).fetchAllTasks();
    super.initState();
  }

  DateTime myDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Padding(
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
          Expanded(child: showYourTasks(myDate),)
        ],
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
