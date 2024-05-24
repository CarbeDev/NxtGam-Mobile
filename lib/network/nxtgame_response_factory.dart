import 'package:mobile_app/network/nxtgam_api.dart';

import '../features/login/repository/login_responses.dart';

class NxtGameResponseFactory<T extends NxtGamResponse> {
  T create(Map<dynamic, dynamic> json) {
    switch (T) {
      case NxtGamLoginResponse:
        return NxtGamLoginResponse(isNewUser: json["isNewUser"]) as T;
      case _:
        throw Exception("${T.runtimeType} can't be create by this factory");
    }
  }
}
