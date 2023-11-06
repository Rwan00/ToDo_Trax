import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../cubits/read_tasks_cubit/read_task_cubit.dart';
import '../../models/task.dart';
import '../theme.dart';
import '../widgets/custom_button.dart';
import '../widgets/input_field.dart';
import 'custom_container.dart';

class EditViewBody extends StatefulWidget {
  final Task task;
  const EditViewBody({super.key, required this.task});

  @override
  State<EditViewBody> createState() => _EditViewBodyState();
}

class _EditViewBodyState extends State<EditViewBody> {
  bool isSwitched = false;
  final TextEditingController? titleController = TextEditingController();
  final TextEditingController? noteController = TextEditingController();
  int _repeat = 0;
  List<String> purposeList = [
    "Work",
    "Personal",
    "Health",
    "Study",
    "Family",
    "Fitness",
    "Travel",
    "Shopping",
    "Entertainment"
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
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
                Row(
                  children: [
                    Text(
                     widget.task.date!,
                      style: headingAddTask.copyWith(fontSize: 12),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      size: 15,
                      color: Color.fromRGBO(119, 119, 119, 1),
                    )
                  ],
                ),
              ],
            ),
             SizedBox(
              height: height*0.025,
            ),
            InputField(
              hint: widget.task.title,
              onChange: (value){
                titleController?.text = value;
              },
              title: 'Title',
              controller: titleController,
            ),
            InputField(
              title: 'Purpose',
              hint: widget.task.purpose == 0
                  ? "Work"
                  : widget.task.purpose == 1
                  ? "Personal"
                  : widget.task.purpose == 2
                  ? "Health"
                  : widget.task.purpose == 3
                  ? "Study"
                  : widget.task.purpose == 4
                  ? "Study"
                  : widget.task.purpose == 5
                  ? "Family"
                  : widget.task.purpose == 6
                  ? "Travel"
                  : widget.task.purpose == 7
                  ? "Shopping"
                  : "Entertainment",
              widget: DropdownButton(
                dropdownColor: Get.isDarkMode ? dPrimaryClr : primaryClr,
                borderRadius: BorderRadius.circular(10),
                items: purposeList
                    .map<DropdownMenuItem<String>>(
                        (value) => DropdownMenuItem(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(color: Colors.white),
                        )))
                    .toList(),
                style: headingAddTask.copyWith(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 16,
                ),
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Color.fromRGBO(119, 119, 119, 1),
                ),
                iconSize: 16,
                elevation: 4,
                underline: Container(
                  height: 0,
                ), onChanged: (String? value) {  },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: InputField(
                    title: 'Start Time',
                    hint: widget.task.startTime,
                    widget:  const Icon(
                      Icons.access_time_rounded,
                      size: 20,
                      color: Color.fromRGBO(119, 119, 119, 1),
                    ),
                  ),
                ),
                 SizedBox(
                  width: width*0.1,
                ),
                Expanded(
                  child: InputField(
                    title: 'End Time',
                    hint: widget.task.endTime,
                    widget: const Icon(
                      Icons.access_time_rounded,
                      size: 20,
                      color: Color.fromRGBO(119, 119, 119, 1),
                    ),
                  ),
                ),
              ],
            ),
            _repeatContainer(),
             SizedBox(
              height: height*0.025,
            ),
            InputField(
              hint: widget.task.description,
              onChange: (value){
                noteController?.text = value;
              },
              title: 'Description',
              controller: noteController,
            ),
             SizedBox(
              height: height*0.025,
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
             SizedBox(
              height: height*0.08,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: MyButton("Edit", () {

                widget.task.title = titleController?.text==""? widget.task.title :titleController?.text;
                print("title: ${titleController?.text}");
                widget.task.description = noteController?.text==""? widget.task.description :noteController?.text;
                widget.task.save();
                Get.back();
              },
                clr: Get.isDarkMode? dPrimaryClr:primaryClr,
              ),
            ),],
        ),
      ),
    );
  }
  _repeatContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            "Repeat",
            style: headingAddTask.copyWith(fontSize: 16),
          ),
        ),
        Row(
            children: List.generate(
              4,
                  (index) => Expanded(
                child: customContainer(
                  context: context,
                    text: index == 0
                        ? "Daily"
                        : index == 1
                        ? "Weekly"
                        : index == 2
                        ? "Monthly"
                        : "None",
                    color: _repeat == index
                        ? Get.isDarkMode
                        ? dPrimaryClr.withOpacity(0.8)
                        : primaryClr.withOpacity(0.3)
                        : null),
              ),
            )),
      ],
    );
  }

}
