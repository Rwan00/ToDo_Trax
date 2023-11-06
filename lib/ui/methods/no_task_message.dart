import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme.dart';

class NoTaskMsg extends StatelessWidget {
  const NoTaskMsg({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
        children: <Widget>[
          AnimatedPositioned(
            duration: const Duration(milliseconds: 2000),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                   SizedBox(
                    height: height*0.15,
                  ),
                  SvgPicture.asset(
                    "assets/images/noData.svg",
                    height: height*0.2,
                    width: width*0.2,
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
                   SizedBox(
                    height: height*0.02,
                  ),
                ],
              ),
            ),
          )
        ],
      );

  }
}
