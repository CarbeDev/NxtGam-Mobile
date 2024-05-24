import 'package:dio/dio.dart';

class NetworkManager {
  NetworkManager._();

  static NetworkManager? _instance;

  static NetworkManager get instance {
    if (_instance == null) {
      _instance = NetworkManager._();
      _instance!.initClient();
    }

    return _instance!;
  }

  late Dio client;

  void initClient() {
    const apiUrl = String.fromEnvironment("NXTGAME_API_URL");
    const apiKey = String.fromEnvironment("NXTGAM_API_KEY");

    if (apiUrl.isEmpty || apiKey.isEmpty) {
      throw Exception("missing secret value");
    }

    client =
        Dio(BaseOptions(baseUrl: apiUrl, headers: {"NXTGAM_API_KEY": apiKey}));
  }
}
