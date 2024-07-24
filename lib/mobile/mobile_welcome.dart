import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rive/rive.dart';
class MobileWelcome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromARGB(255, 232, 201, 184),
        body:  Stack(
                children: [
                  RiveAnimation.asset('riveassets/moving_blobs.riv',),
                    BackdropFilter(
                     filter: ImageFilter.blur(sigmaX: 15.r, sigmaY: 15.r),
                     child: Container(color: Colors.transparent),
                  ), 
                  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              150.verticalSpace,
              Column(
                children: [
                  Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Welcome To Flappy Cat',
                        style: TextStyle(
                          fontSize: 20.r,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Pixeled',
                        ),
                      ),
                    ),
                  ),
                  30.verticalSpace,
                 GestureDetector(
                      child: Container(
                        height: 250.r,
                        width:250.r,
                        child: RiveAnimation.asset('riveassets/start_button.riv',
                        fit: BoxFit.scaleDown,
                        ),
                          ),
                          onTap: (){
                            context.go('/gamepage');
                          },
                    ),
               ],
              ),
              150.verticalSpace,
                     Image.asset('images/MJ.png',height: 40.r,width: 40.r,),
            ],
        ),
                ]
        ),
      ),
    );
  }
}