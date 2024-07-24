import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Cat extends StatelessWidget {
  final catY;
  final double catWidth;
  final double catHeight;
  Cat({this.catY, required this.catWidth, required this.catHeight,});

  @override
  Widget build(BuildContext context) {
    return Container(
                    alignment: Alignment(0, (2 * catY + catHeight) / (2 - catHeight)),
                      child: Image.asset('images/cat.png',
                      width: MediaQuery.of(context).size.height * catWidth,
                      height: MediaQuery.of(context).size.height * 3/4 * catHeight / 2,
                      fit: BoxFit.fill,
                      ),
                  );
  }
}