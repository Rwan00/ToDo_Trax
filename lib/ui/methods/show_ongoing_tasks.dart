import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

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
                    padding: const EdgeInsets.only(top: 8.0,bottom: 8,right: 24),
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