import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/features/home/repository/home_repository.dart';

import 'home_state_classes.dart';

class HomeState {
  final String username;
  final List<JoinedLeague> leagues;
  final int bottomBarIndex;

  HomeState._(
      {required this.username,
      required this.leagues,
      required this.bottomBarIndex});

  static Future<HomeState> create() async {
    final userInfo = await HomeRepository.getJoinedLeague();
    return HomeState._(
        bottomBarIndex: 0,
        username: userInfo.username,
        leagues: JoinedLeague.from(userInfo.leagues));
  }
}

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(HomeState._(username: "", leagues: [], bottomBarIndex: 0)) {
    _init();
  }

  Future<void> _init() async {
    final initialState = await HomeState.create();
    emit(initialState);
  }

  void changeView(int newIndex) {
    emit(HomeState._(
        username: state.username,
        leagues: state.leagues,
        bottomBarIndex: newIndex));
  }
}
