import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/features/new_account/new_account_repository.dart';

class NewAccountCubit extends Cubit<NewAccountState> {
  NewAccountCubit() : super(NewAccountState(""));

  void updateUsername(String newValue) {
    emit(NewAccountState(newValue));
  }

  Future<void> saveUsername() async {
    print(state.username);
    await NewAccountRepository().sendUsername(state.username);
  }
}

class NewAccountState {
  final String username;
  late final bool isUsernameValid;

  NewAccountState(this.username) {
    isUsernameValid = username.length >= 3;
  }
}