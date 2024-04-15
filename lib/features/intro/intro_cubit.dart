import 'package:flutter_bloc/flutter_bloc.dart';

class IntroCubit extends Cubit<IntroState> {
  IntroCubit() : super(InProgressIntoState(0));

  void goNext() {
    if (state is FinishedIntroState) throw Exception();

    var currentState = (state as InProgressIntoState);
    if (currentState.isLastData) {
      emit(FinishedIntroState());
    } else {
      emit(InProgressIntoState(currentState.displayedData++));
    }
  }
}

abstract class IntroState {
  static final introData = [
    IntroScreenData("assets/svg/team-svgrepo-com.svg", "CreateTeamIntroTitle",
        "CreateTeamIntroDescription"),
    IntroScreenData("", "PointSystemIntroTitle", "PointSystemIntroDescription"),
    IntroScreenData("", "LeagueIntroTitle", "LeagueIntroDescription")
  ];
}

class InProgressIntoState extends IntroState {
  int displayedData;
  late bool isLastData;

  InProgressIntoState(this.displayedData) {
    isLastData = displayedData >= IntroState.introData.length;
  }
}

class FinishedIntroState extends IntroState {}

class IntroScreenData {
  String svgPath;
  String title;
  String description;

  IntroScreenData(this.svgPath, this.title, this.description);
}
