import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme.dart';

class NoTaskMsg extends StatelessWidget {
  const NoTaskMsg({super.key});

  @override
  Widget build(BuildContext context) {
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
                  SvgPicture.asset(
                    "assets/images/noData.svg",
                    height: 160,
                    width: 210,
                    semanticsLabel: "Task",
                    colorFilter: const ColorFilter.mode(
                        Color.fromRGBO(26, 115, 233, 1), BlendMode.dst),
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
}
