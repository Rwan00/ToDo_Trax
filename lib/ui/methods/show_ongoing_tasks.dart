import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../widgets/task_tile.dart';

Expanded showOngoingTasks(Widget widget) {
  return Expanded(
    child: ListView.builder(
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
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child:  widget,
                  ),
                ),
              ),
            ),
          );
        }
    ),
  );
}