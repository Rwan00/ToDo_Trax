import 'package:flutter/material.dart';

separator()
{
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
        width: 258,
        height: 2.5,
        color: const Color.fromRGBO(119, 119, 119, 1),
      ),
    ],
  );
}