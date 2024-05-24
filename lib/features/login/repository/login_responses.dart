import 'package:mobile_app/network/nxtgam_api.dart';

class NxtGamLoginResponse extends NxtGamResponse {
  final bool isNewUser;

  NxtGamLoginResponse({required this.isNewUser});
}
