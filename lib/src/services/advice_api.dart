import 'package:advisor/src/models/advice.dart';
import 'package:http/http.dart' as http;
import 'package:momentum/momentum.dart';

abstract class AdviceRepository {
  Future<Advice> getRandomAdvice();
}

class ConcreteAdviceRepository extends MomentumService with AdviceRepository {
  @override
  Future<Advice> getRandomAdvice() async {
    final String url = 'https://api.adviceslip.com/advice';
    http.Response response = await http.get(url);
    return adviceFromJson(response.body);
  }
}
