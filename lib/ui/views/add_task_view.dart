import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_trax/ui/theme.dart';
import 'package:todo_trax/ui/views/ongoing_view.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
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
          onPressed: () => Get.to(const Ongoing()),
          color: const Color.fromRGBO(167, 167, 167, 1),
          icon: const Icon(Icons.clear_rounded,size: 32,),
        ),
      ),

      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 24),
        child:  SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text("Schedule",style: headingAddTask,),
                  const Spacer(),
                  GestureDetector(
                    onTap: (){},
                    child: Row(
                      children: [
                        Text("12 October",style: headingAddTask.copyWith(fontSize: 12),),
                        const SizedBox(width: 10,),
                        const Icon(Icons.keyboard_arrow_down,size: 15,color: Color.fromRGBO(119, 119, 119, 1),)
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
