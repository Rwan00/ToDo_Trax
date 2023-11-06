import 'package:flutter/material.dart';

separator(BuildContext context)
{
  double width = MediaQuery.of(context).size.width;
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
      Container(
        width: 6,
        height: 6,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromRGBO(119, 119, 119, 1),
        ),
      ),
      Container(
        width: width*0.6,
        height: 2.5,
        color: const Color.fromRGBO(119, 119, 119, 1),
      ),
    ],
  );
}