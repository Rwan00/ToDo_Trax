import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo_trax/ui/views/your_tasks_view.dart';
import '../../cubits/read_tasks_cubit/read_task_cubit.dart';
import '../methods/app_bar.dart';
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
    DateTime myDate = DateTime.now();

    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      appBar: buildAppBar(context),
      body: Padding(
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
                  const SizedBox(
                    height: 12,
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
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    DateFormat('MMM,d,y').format(myDate),
                    style: txtOngoing1.copyWith(fontSize: 12),
                  )
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
                      imgUrl: "assets/images/calender.svg",
                      containerClr: Get.isDarkMode ? dPrimaryClr : primaryClr,
                      iconClr: Colors.white,
                      p: 6,
                    )),
              ],
            ),
            //_noTaskMsg()
            BlocProvider(
              create: (context)=> TasksCubit(),
                child: showOngoingTasks(OngoingTaskTile())
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
}

_noTaskMsg() {
  return Stack(
    children: <Widget>[
      AnimatedPositioned(
        duration: const Duration(milliseconds: 2000),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 150,
              ),
              /*Image.asset(
                "assets/images/noData.png",
                height: 150,
                width: 250,
              ),*/
              SvgPicture.asset(
                "assets/images/noData.svg",
                height: 160,
                width: 210,
                semanticsLabel: "Task",
                colorFilter: const ColorFilter.mode(
                    Color.fromRGBO(26, 115, 233, 1),
                    BlendMode.dst),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Text(
                  "No Tasks Found",
                  style: txtOngoing3,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 180,
              ),
            ],
          ),
        ),
      )
    ],
  );
}
