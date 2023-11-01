import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_trax/cubits/read_tasks_cubit/read_task_cubit.dart';

import '../../models/task.dart';
import '../theme.dart';
import '../widgets/ongoing_task_tile.dart';

 showOngoingTasks() {
  return BlocBuilder<TasksCubit,TasksState>(
    builder: (context,state){
      List<Task> tasks = BlocProvider.of<TasksCubit>(context).tasks ?? [];
      /*if(state is TasksSuccess && state.tasks.isEmpty)
        {
          print(state.tasks.length);
          return _noTaskMsg();
        }*/


         return ListView.builder(
           itemCount: tasks.length,
             itemBuilder: (BuildContext context,int index){
               return AnimationConfiguration.staggeredList(
                 duration: const Duration(milliseconds: 500),
                 position: index,
                 child: SlideAnimation(
                   horizontalOffset: 100,
                   child: FadeInAnimation(
                     child: GestureDetector(
                       onTap: (){},
                       child:   Padding(
                         padding: const EdgeInsets.only(top: 8.0,bottom: 8,right: 24),
                         child:  OngoingTaskTile(task:tasks[index]),
                       ),
                     ),
                   ),
                 ),
               );
             }
         );
       }


  );
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
