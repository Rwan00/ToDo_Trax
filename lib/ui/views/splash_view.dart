import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo_trax/ui/views/ongoing_view.dart';

import '../theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String imageUrl = "assets/images/loading.gif";
  double _position = -200;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      startAnimation();

      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          // Change the image URL after 2 seconds
          imageUrl = "assets/images/Next.png";
        });
      });
    });
  }

  void startAnimation() {
    setState(() {
      _position = MediaQuery.of(context).size.width / 2 -
          100; // Center position minus half of the text width
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(seconds: 3),
                    // Duration of the animation
                    curve: Curves.bounceInOut,
                    // Animation curve
                    right: _position,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 300,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/icon.png"),
                            const SizedBox(
                              width: 6,
                            ),
                            Column(
                              children: [
                                Text(
                                  'To Do',
                                  style: txtSplash,
                                ),
                                Text(
                                  'Trax',
                                  style: txtSplash,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
           GestureDetector(
             onTap: (){
               Navigator.pushReplacement(
                   context,
                   PageTransition(
                     child: const Ongoing(),
                     type: PageTransitionType.rightToLeft,
                     curve: Curves.easeIn,
                     //alignment: Alignment.bottomLeft,
                     duration: const Duration(milliseconds: 700),
                   ));
             },
             child: Image.asset(
               imageUrl,
                    height: 70,
                  ),
           ),
          const SizedBox(height: 30,)
        ],
      ),
    );
  }
}
