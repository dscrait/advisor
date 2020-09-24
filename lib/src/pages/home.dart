import 'dart:math';

import 'package:advisor/src/components/home/home.controller.dart';
import 'package:advisor/src/components/home/home.model.dart';
import 'package:advisor/src/models/advice.dart';
import 'package:flutter/material.dart';
import 'package:momentum/momentum.dart';
import 'package:relative_scale/relative_scale.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends MomentumState<Home> {
  @override
  void initMomentumState() async {
    var controller = Momentum.controller<HomeController>(context);
    await controller.getAdvice();
    super.initMomentumState();
  }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, screenHeight, screenWidth, sy, sx) {
        return MomentumBuilder(
          controllers: [HomeController],
          builder: (context, snapshot) {
            Advice advice = snapshot<HomeModel>().advice;
            var homeController = snapshot<HomeModel>().controller;
            return Scaffold(
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.startFloat,
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.favorite),
                onPressed: () {},
              ),
              body: Stack(
                children: [
                  Positioned(
                    right: -screenWidth * 0.5,
                    top: sy(48),
                    child: Stack(
                      children: List.generate(
                        5,
                        (index) {
                          var op = (1 - (0.2 * index)).toDouble();
                          print(op);
                          return Transform.rotate(
                            angle: -(pi / 20) * (4 - index),
                            child: Container(
                              height: screenHeight * 0.8,
                              width: screenWidth * 1.2,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                  colors: [
                                    Color(0xFF00c6ff).withOpacity(op),
                                    Color(0xFF0072ff).withOpacity(op),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: GestureDetector(
                      onDoubleTap: () async {
                        await homeController.getAdvice();
                      },
                      child: Center(
                        child: Container(
                          child: advice.slip == null
                              ? CircularProgressIndicator()
                              : Padding(
                                  padding: EdgeInsets.all(sx(48)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '\"',
                                        style: TextStyle(
                                            fontSize: sy(56),
                                            color: Colors.white),
                                      ),
                                      Text(
                                        advice.slip.advice + '\n\n',
                                        style: TextStyle(
                                          fontSize: sy(22),
                                        ),
                                      ),
                                      Text(
                                        advice.slip.id.toString(),
                                        style: TextStyle(
                                          fontSize: sy(12),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
