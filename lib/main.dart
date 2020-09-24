import 'package:advisor/src/components/home/home.controller.dart';
import 'package:advisor/src/services/advice_api.dart';
import 'package:flutter/material.dart';
import 'package:momentum/momentum.dart';
// Because https://github.com/xamantra/momentum/issues/31
// ignore: implementation_imports
import 'package:momentum/src/momentum_router.dart' as momentum_router;
import 'src/pages/home.dart';
import 'src/services/client_db.dart';

void main() {
  runApp(momentum());
}

Momentum momentum() {
  return Momentum(
    controllers: [HomeController()],
    services: [
      ClientDB(),
      momentum_router.Router([Home()]),
      ConcreteAdviceRepository()
    ],
    child: Advisor(),
  );
}

class Advisor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advisor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: momentum_router.Router.getActivePage(context),
    );
  }
}
