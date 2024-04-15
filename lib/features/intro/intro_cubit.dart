import 'package:flutter_bloc/flutter_bloc.dart';

class IntroCubit extends Cubit<IntroState> {
  IntroCubit() : super(InProgressIntroState(0));

  void goNext() {
    if (state is FinishedIntroState) throw Exception();

    var currentState = (state as InProgressIntroState);
    if (currentState.isLastData) {
      emit(FinishedIntroState());
    } else {
      emit(InProgressIntroState(++currentState.displayedData));
    }
  }
}

abstract class IntroState {
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
}

class InProgressIntroState extends IntroState {
  int displayedData;
  late bool isLastData;

  InProgressIntroState(this.displayedData) {
    isLastData = displayedData >= IntroState.introData.length - 1;
  }

  IntroScreenData getData() {
    return IntroState.introData[displayedData];
  }
}

class FinishedIntroState extends IntroState {}

class IntroScreenData {
  String svgPath;
  String title;
  String description;

  IntroScreenData(this.svgPath, this.title, this.description);
}
