import 'package:flutter_bloc/flutter_bloc.dart';

class NewAccountCubit extends Cubit<NewAccountState> {
  NewAccountCubit() : super(NewAccountState(""));

  void updateUsername(String newValue) {
    emit(NewAccountState(newValue));
  }
}

class NewAccountState {
  final String usernameValue;
  late final bool isUsernameValid;

  NewAccountState(this.usernameValue) {
    isUsernameValid = usernameValue.length >= 3;
  }
}