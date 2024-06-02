import 'package:mobile_app/network/nxtgam_api.dart';

import '../features/login/repository/login_responses.dart';

class NxtGameResponseFactory<T extends NxtGamResponse> {
  T create(Map<dynamic, dynamic>? json) {
    if (T is NxtGamEmptyResponse) {
      return NxtGamEmptyResponse() as T;
    }

    switch (T) {
      case NxtGamLoginResponse:
        return NxtGamLoginResponse.from(json!) as T;
      case NxtGamEmptyResponse:
        return NxtGamEmptyResponse() as T;
      case _:
        throw Exception("$T can't be create by this factory");
    }
  }
}
