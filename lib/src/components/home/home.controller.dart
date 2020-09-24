import 'package:advisor/src/models/advice.dart';
import 'package:advisor/src/services/advice_api.dart';
import 'package:momentum/momentum.dart';

import 'index.dart';

class HomeController extends MomentumController<HomeModel> {
  @override
  HomeModel init() {
    return HomeModel(
      this,
      advice: Advice(),
      favourites: <Advice>[],
    );
  }

  Future<void> getAdvice() async {
    AdviceRepository adviceRepository = getService<ConcreteAdviceRepository>();
    var advice = await adviceRepository.getRandomAdvice();
    model.update(advice: advice);
  }
}
