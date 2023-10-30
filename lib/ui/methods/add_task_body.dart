import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_trax/ui/methods/task_added_dialog.dart';

import '../theme.dart';
import '../widgets/custom_button.dart';
import '../widgets/input_field.dart';
import 'custom_container.dart';

class AddTaskBody extends StatefulWidget {
  const AddTaskBody({super.key});

  @override
  State<AddTaskBody> createState() => _AddTaskBodyState();
}

class _AddTaskBodyState extends State<AddTaskBody> {
  bool isSwitched = false;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  int _repeat = 0;
  DateTime _selectedDate = DateTime.now();
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
  String _selectedPurpose = "Work";
  String _startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  String _endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 15)))
      .toString();
  int _reminder = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
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
              onTap: () => _getDateFromUser(),
              child: Row(
                children: [
                  Text(
                    DateFormat('d MMMM').format(_selectedDate),
                    style: headingAddTask.copyWith(fontSize: 12),
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
        InputField(
          title: 'Title',
          controller: _titleController,
        ),
        InputField(
          title: 'Purpose',
          hint: _selectedPurpose,
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
            onChanged: (String? newValue) {
              setState(() {
                _selectedPurpose = newValue!;
              });
            },
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: Color.fromRGBO(119, 119, 119, 1),
            ),
            iconSize: 16,
            elevation: 4,
            underline: Container(
              height: 0,
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: InputField(
                title: 'Start Time',
                hint: _startTime,
                widget: IconButton(
                  onPressed: () => _getTimeFromUser(isStartTime: true),
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
                hint: _endTime,
                widget: IconButton(
                  onPressed: () => _getTimeFromUser(isStartTime: false),
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
        _repeatContainer(),
        const SizedBox(
          height: 24,
        ),
        InputField(
          title: 'Description',
          controller: _noteController,
        ),
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
                  _reminder = isSwitched ? 1 : 0;
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
            if ((_titleController.text.isNotEmpty &&
                !_titleController.text.isNum) &&
                (_noteController.text.isNotEmpty &&
                    !_noteController.text.isNum)) {

            } else if (_titleController.text.isEmpty ||
                _noteController.text.isEmpty) {
              null;
            } else {
              print("############SOMETHING BAD HAPPENED##########");
            }
          },
              clr: _titleController.text.isEmpty ||
                  _noteController.text.isEmpty
                  ? const Color.fromRGBO(184, 184, 184, 1)
                  : Get.isDarkMode
                  ? dPrimaryClr
                  : primaryClr),
        ),
      ],
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
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _repeat = index;
                    });
                  },
                  child: customContainer(
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
              ),
            )),
      ],
    );
  }

  _getDateFromUser() async {
    DateTime? _pickedDate = await showDatePicker(
      initialEntryMode: DatePickerEntryMode.input,
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2015),
      lastDate: DateTime(2030),
    );
    if (_pickedDate != null) {
      setState(() {
        _selectedDate = _pickedDate;
      });
    } else {
      print("IT'S NULL OR SOMETHING IS WRONG!!");
    }
  }

  _getTimeFromUser({required bool isStartTime}) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: isStartTime
          ? TimeOfDay.fromDateTime(DateTime.now())
          : TimeOfDay.fromDateTime(
          DateTime.now().add(const Duration(minutes: 15))),
    );

    String formattedTime = pickedTime!.format(context);

    if (isStartTime) {
      setState(() {
        _startTime = formattedTime;
      });
    } else if (!isStartTime) {
      setState(() {
        _endTime = formattedTime;
      });
    } else {
      print("IT'S NULL OR SOMETHING IS WRONG!!");
    }
  }
}
