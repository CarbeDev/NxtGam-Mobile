import 'package:flutter_bloc/flutter_bloc.dart';

class IntroCubit extends Cubit<IntroState> {
  IntroCubit() : super(IntroState(0));

  void goNext() {
    emit(IntroState(++state.displayedData));
  }
}

class IntroState {
  int displayedData;
  late bool isLastData;

  static final introData = [
    IntroScreenData("assets/svg/team-intro.svg", "CreateTeamIntroTitle",
        "CreateTeamIntroDescription"),
    IntroScreenData("assets/svg/checkmark-circle.svg", "PointSystemIntroTitle",
        "PointSystemIntroDescription"),
    IntroScreenData(
        "assets/svg/ranking.svg", "LeagueIntroTitle", "LeagueIntroDescription"),
    IntroScreenData(
        "assets/svg/cart.svg", "MarketIntroTitle", "MarketIntroDescription")
  ];

  IntroState(this.displayedData) {
    isLastData = displayedData >= IntroState.introData.length - 1;
  }

  IntroScreenData getData() {
    return IntroState.introData[displayedData];
  }
}

class IntroScreenData {
  String svgPath;
  String title;
  String description;

  IntroScreenData(this.svgPath, this.title, this.description);
}
