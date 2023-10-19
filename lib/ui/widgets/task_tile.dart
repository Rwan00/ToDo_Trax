import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_trax/ui/theme.dart';

class TaskTile extends StatefulWidget {
   const TaskTile({super.key});

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      //padding: const EdgeInsets.symmetric(vertical: 25),
      height: 90,
      //margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffBFBFBF),width: 0.3),
        borderRadius: BorderRadius.circular(8),
        color:  Get.isDarkMode? const Color.fromRGBO(44, 44, 44, 1):Colors.white,
      ),
      child: Row(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: CircleAvatar(
              backgroundColor: myOrange,
              radius: 20,
              child: Center(
                child: Icon(
                  Icons.work,
                  size: 17,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Column(
            children: <Widget>[
              const SizedBox(height: 16,),
              Text(
                "Salon UX",
                style: heading,
              ),
              const SizedBox(height: 6.5,),
              Row(
                children: <Widget>[
                  const Icon(Icons.access_time_rounded,
                    color: Color.fromRGBO(119, 119, 119, 1),size: 12,),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    "10 : 00 Am - 06 : 00 Pm",
                    style: subHeading,
                  ),
                ],
              ),
              const SizedBox(height: 5.5,),
              Row(
                children: <Widget>[
                  const SizedBox(width: 10,),
                  Text("Due Date : October 25",style: subHeading,),

                ],
              ),
            ],
          ),
          const SizedBox(width: 120,),
          Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 7),
                  child: Container(
                    width: 50,
                    height: 18,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Get.isDarkMode? const Color.fromRGBO(169, 169, 169, 1):const Color.fromRGBO(242, 237, 237, 1)
                    ),
                    child: Center(
                      child: Text("Low",style: subHeading.copyWith(color: Colors.black),),
                    ),
                  ),
                ),
                const SizedBox(height: 28,),
                Text("Completed",style: subHeading.copyWith(color: const Color.fromRGBO(20, 99, 0, 1)),),
                //const SizedBox(height: 16,),
              ]
          )
        ],
      ),
    );
  }
}
