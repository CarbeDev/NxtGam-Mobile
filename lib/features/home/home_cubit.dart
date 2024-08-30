import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/features/home/repository/home_repository.dart';

import 'home_state_classes.dart';

class HomeState {
  final String username;
  final List<JoinedLeague> leagues;

  HomeState._({required this.username, required this.leagues});

  static Future<HomeState> create() async {
    final userInfo = await HomeRepository.getJoinedLeague();
    return HomeState._(
        username: userInfo.username,
        leagues: JoinedLeague.from(userInfo.leagues));
  }
}

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState._(username: "", leagues: [])) {
    _init();
  }

  Future<void> _init() async {
    final initialState = await HomeState.create();
    emit(initialState);
  }
}
