import 'package:floppycat/mobile/lock_screen.dart';
import 'package:floppycat/mobile/mobile_celebration.dart';
import 'package:floppycat/mobile/mobile_game.dart';
import 'package:floppycat/mobile/mobile_welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(FloppyCat());
}

class FloppyCat extends StatefulWidget {
  @override
  State<FloppyCat> createState() => _FloppyCatState();
}

class _FloppyCatState extends State<FloppyCat> {
  final DateTime unlockDate = DateTime(2024, 07, 25);

  final _router = GoRouter(
    initialLocation: '/firstpage',
    routes: [
      GoRoute(
        path: '/firstpage',
        builder: (context, state) => MobileWelcome(),
      ),
      GoRoute(
        path: '/gamepage',
        builder: (context, state) => MobileGame(),
      ),
      GoRoute(
        path: '/lastpage',
        builder: (context, state) => MobileCelebration(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();

    if (currentDate.isBefore(unlockDate)) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LockScreen(),
      );
    } else {
      return ScreenUtilInit(
        designSize: const Size(414.0, 896.0),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flappy Cat',
          routerConfig: _router,
        ),
      );
    }
  }
}