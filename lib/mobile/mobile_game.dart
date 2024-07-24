import 'dart:async';
import 'package:floppycat/mobile/barriers.dart';
import 'package:floppycat/mobile/cat.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class MobileGame extends StatefulWidget {
  @override
  State<MobileGame> createState() => _MobileGameState();
}
class _MobileGameState extends State<MobileGame> {
  static double catY=0;
  double initailPos=catY;
  double height=0;
  double time=0;
  double gravity = -4.9;
  double velocity = 3;
  double catWidth =0.1;
  double catHeight =0.1;
  bool gameHasStarted=false;
 
//barrier
static List<double> barrierX =[2, 2 + 1.5];
static double barrierWidth = 0.5;
List<List<double>> barrierHeight=[
  [0.6,0.4],
  [0.4,0.6],
];
  void startGame(){
    gameHasStarted=true;
    Timer.periodic(Duration(milliseconds: 10), (timer){
      height= gravity * time * time + velocity * time;
      setState(() {
        catY= initailPos - height;
      });
      if (catIsDead()){
        timer.cancel;
        gameHasStarted=false;
        context.go('/lastpage');
      }
      moveMap();
      time += 0.01;
    }
    );
  }
  void moveMap(){
    for(int i=0;i<barrierX.length;i++){
      setState(() {
        barrierX[i]-=0.005;
      });
      if (barrierX[i]<-1.5){
        barrierX[i]+=3;
      }
    }
  }
  void jump(){
    setState(() {
    time=0;
    initailPos=catY;
    });
  }
  bool catIsDead(){
  if(catY <-1 || catY > 1)
    {
    return true;
    } 
    //if hits
    for (int i = 0; i < barrierX.length; i++) {
      if (barrierX[i]<= barrierWidth&&
          barrierX[i] + barrierWidth >= -barrierWidth &&
      (catY <= -1 + barrierHeight[i][0]|| 
      catY + catHeight >= 1- barrierHeight[i][1])) {
        return true;
      }
    }
    return false;
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:gameHasStarted ? jump:startGame, //if the game started then jump else start game
      child: Scaffold(
        body: Column(
          children: [
          Expanded(
            flex: 3,
            child:Container(
              color: const Color.fromARGB(255, 235, 168, 158),
              child: Center(
                child: Stack(children: [
                  Cat(
                    catY: catY, 
                    catWidth: catWidth, 
                    catHeight: catHeight, 
                  ),
                  MyBarrier(
                    barrierX: barrierX[0],
                    barrierHeight: barrierHeight[0][0],
                    barrierWidth: barrierWidth,
                    isThisBottomBarrier: false,
                    ),
                    MyBarrier(
                    barrierX: barrierX[0],
                    barrierHeight: barrierHeight[0][1],
                    barrierWidth: barrierWidth,
                    isThisBottomBarrier: true,
                    ),
                    MyBarrier(
                    barrierX: barrierX[1],
                    barrierHeight: barrierHeight[1][0],
                    barrierWidth: barrierWidth,
                    isThisBottomBarrier: false,
                    ),
                    MyBarrier(
                    barrierX: barrierX[1],
                    barrierHeight: barrierHeight[1][1],
                    barrierWidth: barrierWidth,
                    isThisBottomBarrier: true,
                    ),
                ],
                ),
              ),
            ),
            ),
            Expanded(
            child:Container(
              color: const Color.fromARGB(255, 109, 89, 122),
            ),
            ),
        ],
        ),
      ),
    );
  }
}