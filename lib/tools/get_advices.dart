import 'package:advisor/src/models/advice.dart';
import 'package:advisor/src/services/advice_api.dart';
// ignore: unused_import
import 'package:flutter/widgets.dart';

main() async {
  AdviceRepository adviceRepository = ConcreteAdviceRepository();
  for (var i = 0; i < 20; i++) {
    Advice advice = await adviceRepository.getRandomAdvice();
    print(advice.slip.advice);
  }
}
