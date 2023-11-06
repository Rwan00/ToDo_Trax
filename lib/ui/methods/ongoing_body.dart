import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo_trax/ui/methods/show_ongoing_tasks.dart';

import '../../cubits/read_tasks_cubit/read_task_cubit.dart';
import '../theme.dart';
import '../views/your_tasks_view.dart';
import '../widgets/custom_icon.dart';
import '../widgets/ongoing_task_tile.dart';
import '../widgets/separator.dart';

class OngoingBody extends StatefulWidget {
  const OngoingBody({super.key});

  @override
  State<OngoingBody> createState() => _OngoingBodyState();
}

class _OngoingBodyState extends State<OngoingBody> {
  @override
  void initState() {
    BlocProvider.of<TasksCubit>(context).fetchAllTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    DateTime myDate = DateTime.now();
    return Padding(
      padding: const EdgeInsets.only(left: 32),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ready to do your Daily Tasks ?? ",
                  style: headingOngoing,
                ),
                 SizedBox(
                  height: height*0.015,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "Today’s ",
                      style: txtOngoing1,
                    ),
                    Text(
                      DateFormat.EEEE().format(myDate),
                      style: txtOngoing1.copyWith(
                          color: Get.isDarkMode ? dPrimaryClr : primaryClr),
                    ),
                  ],
                ),
                 SizedBox(
                  height: height*0.005,
                ),
                Text(
                  DateFormat('MMM,d,y').format(myDate),
                  style: txtOngoing1.copyWith(fontSize: 12),
                )
              ],
            ),
          ),
           SizedBox(
            height: height*0.015,
          ),
          separator(context),
           SizedBox(
            height: height*0.02,
          ),
          Row(
            children: <Widget>[
              Text(
                "Ongoing",
                style: txtOngoing2,
              ),
              const Spacer(),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                          child: const YourTasks(),
                          type: PageTransitionType.rightToLeft,
                          //alignment: Alignment.bottomLeft,
                          duration: const Duration(milliseconds: 700),
                        ));
                  },
                  child: buildIcon(
                    context: context,
                    imgUrl: "assets/images/calender.svg",
                    containerClr: Get.isDarkMode ? dPrimaryClr : primaryClr,
                    iconClr: Colors.white,
                    p: 6,
                  )),
            ],
          ),
          //_noTaskMsg()
          Expanded(
            child: showOngoingTasks(),
          )

        ],
      ),
    );
  }
}
