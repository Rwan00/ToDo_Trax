import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../methods/app_bar.dart';
import '../widgets/task_tile.dart';


class Ongoing extends StatelessWidget {
  const Ongoing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      appBar: buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(

          children: [
            TaskTile(),
          ],
        ),
      ),
    );
  }


}
