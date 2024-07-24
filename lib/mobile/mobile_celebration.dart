import 'dart:ui';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';
import 'package:video_player/video_player.dart';

class MobileCelebration extends StatefulWidget {

  @override
  _MobileCelebrationState createState() => _MobileCelebrationState();
}

class _MobileCelebrationState extends State<MobileCelebration> {
  late ConfettiController _controller;
  @override

  final player = VideoPlayerController.asset('music/its_birthday.mp3');

  Future<void> initializePlayer() async {
    await player.initialize();
    player.setLooping(true);
  }
  void showConfeti(){
    _controller.play();
  }

  @override
  void initState() {
    super.initState();
    initializePlayer();
     _controller=ConfettiController(duration: const Duration(seconds: 10));
  }

  @override
  void dispose() {
    player.dispose();
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 232, 201, 184),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 400.r,
                width: 500.r,
                child: Stack(
                  children: [
                    RiveAnimation.asset('riveassets/happybirthday.riv'
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0).r,
            child: Text(
              'Happy BIRTHDAY BABY \n\n\n You are getting old',
              style: TextStyle(
                fontSize: 20.r,
                fontFamily: 'Pixeled',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          GestureDetector(
            onTap: () {
              if (player.value.isPlaying) {
                player.pause();
              } else {
                player.play();
                showConfeti();
              }
            },
            child: Image.asset('riveassets/duck.gif', height: 230.r, width: 230.r)),
          GestureDetector(
              onTap: () {
              if (player.value.isPlaying) {
                player.pause();
              } else {
                player.play();
                showConfeti();
              }
            },
            child: Stack(
              children: [
                  Image.asset('riveassets/duck_twerk.gif', height: 170.r, width: 170.r),
                Center(
                  child: ConfettiWidget(
                    confettiController: _controller,
                    blastDirectionality: BlastDirectionality.explosive,
                    shouldLoop:false ,
                    colors: [
                      Colors.black,
                      Colors.red,
                      Colors.purple,
                      Colors.green,
                      Colors.blue,
                      Colors.yellow,
                      Colors.orange,
                      Colors.blueGrey
                    ],
                  ),
                )
              ],
            ),
          ),
            ]
          ),
         Padding(
           padding: const EdgeInsets.all(20.0).r,
           child: Text(
                      'Slap My Butt to Celebrate',
                    style: TextStyle(
                      fontSize: 20.r,
                      fontWeight:FontWeight.bold
                    )),
         )
        ],
      ),
    );
    
  }

}
