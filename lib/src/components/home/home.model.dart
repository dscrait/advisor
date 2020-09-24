import 'package:advisor/src/models/advice.dart';
import 'package:momentum/momentum.dart';

import 'index.dart';

class HomeModel extends MomentumModel<HomeController> {
  HomeModel(HomeController controller, {this.advice, this.favourites})
      : super(controller);

  final Advice advice;
  final List<Advice> favourites;

  @override
  void update({Advice advice, List<Advice> favourites}) {
    HomeModel(
      controller,
      advice: advice ?? this.advice,
      favourites: favourites ?? this.favourites,
    ).updateMomentum();
  }

  Map<String, dynamic> toJson() {
    return {
      'advice': advice.toJson(),
      'favourites': favourites
          ?.map(
            (advice) => advice?.toJson(),
          )
          ?.toList(),
    };
  }

  HomeModel fromJson(Map<String, dynamic> map) {
    if (map == null) return null;

    return HomeModel(
      controller,
      favourites: List<Advice>.from(
        map['favourites']?.map(
          (x) => Advice.fromJson(x),
        ),
      ),
      advice: Advice.fromJson(
        map['topAiring'],
      ),
    );
  }
}
