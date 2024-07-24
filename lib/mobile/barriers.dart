import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class MyBarrier extends StatelessWidget {
final barrierWidth;
final barrierHeight;
final barrierX;
final bool isThisBottomBarrier;
MyBarrier(
{
this.barrierHeight,
this.barrierWidth,
required this.isThisBottomBarrier,
this.barrierX});

@override
Widget build (BuildContext context) {
return Container(
alignment: Alignment ((2 * barrierX + barrierWidth) / (2 - barrierWidth),
isThisBottomBarrier ? 1: -1),
child: Container(
color: Color.fromARGB(255, 53, 79, 112),
width: 100.r,
height: 200.r 
),
);
}
}