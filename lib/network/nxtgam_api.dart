import 'package:dio/dio.dart';
import 'package:mobile_app/network/network_manager.dart';
import 'package:mobile_app/network/nxtgame_response_factory.dart';

class NxtGamApi {
  static final client = NetworkManager.instance.client;

  static Future<T> get<T extends NxtGamResponse>(
      {required String endpoint, Map<String, String>? requestParam}) async {
    final Response<Map> response =
        await client.get(endpoint, data: requestParam);
    final Map<dynamic, dynamic> jsoned = response.data!;

    return NxtGameResponseFactory<T>().create(jsoned);
  }
}

abstract class NxtGamResponse {}
