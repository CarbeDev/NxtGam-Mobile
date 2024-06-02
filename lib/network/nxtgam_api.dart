import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_app/network/network_manager.dart';
import 'package:mobile_app/network/nxtgame_response_factory.dart';

class NxtGamApi {
  static final client = NetworkManager.instance.client;

  static Future<T> makeRequest<T extends NxtGamResponse>(
      {required RequestType requestType,
      required String endpoint,
      Map<String, String>? requestBody}) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;

    client.options.headers["NXTGAM_USER_ID"] = userId;
    final Response<Map> response = await _clientRequest(
        client: client,
        requestType: requestType,
        endpoint: endpoint,
        requestBody: requestBody);
    final Map<dynamic, dynamic>? jsoned = response.data;

    return NxtGameResponseFactory<T>().create(jsoned);
  }

  static Future<Response<Map>> _clientRequest(
      {required Dio client,
      required RequestType requestType,
      required String endpoint,
      Map<String, String>? requestBody}) async {
    switch (requestType) {
      case RequestType.get:
        return await client.get(endpoint, data: requestBody);
      case RequestType.put:
        return await client.put(endpoint, data: requestBody);
    }
  }
}

abstract class NxtGamResponse {}

class NxtGamEmptyResponse extends NxtGamResponse {}

enum RequestType { get, put }
