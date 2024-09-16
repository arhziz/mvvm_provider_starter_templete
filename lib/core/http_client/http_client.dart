import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mvvm_project/core/api/api.dart';
import 'package:mvvm_project/core/http_client/i_http_client.dart';

@dev
@Injectable(as: IHttpClient)
class HttpClient implements IHttpClient {
  final Api _api;

  HttpClient({required Api api}) : _api = api;

  @override
  Future<Response> deleteHttp(String route, body,
      {Map<String, dynamic>? params}) {
    return _api.dio.delete(
      route,
      data: body,
      queryParameters: params,
    );
  }

  @override
  Future<Response> getHttp(String route,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? params,
      bool formdata = false}) {
    return _api.dio.get(
      route,
      data: body,
      queryParameters: params,
    );
  }

  @override
  Future<Response> makeRequest(Future<Response> future) {
    throw UnimplementedError();
  }

  @override
  Future<Response> postHttp(String route, body,
      {Map<String, dynamic>? params,
      bool formdata = false,
      bool formEncoded = false,
      void Function({int count, int total})? onSendProgress,
      void Function({int count, int total})? onRecieveProgress}) async {
    params?.removeWhere((key, value) => value == null);

    if (formdata) {
      body = FormData.fromMap(body as Map<String, dynamic>);
    }

    return await _api.dio.post(
      route,
      data: body,
      onSendProgress: (count, total) {
        if (onSendProgress != null) {
          onSendProgress(count: count, total: total);
        }
      },
      onReceiveProgress: ((count, total) {
        if (onRecieveProgress != null) {
          onRecieveProgress(count: count, total: total);
        }
      }),
      queryParameters: params,
    );
  }

  @override
  Future<Response> putHttp(String route, body,
      {Map<String, dynamic>? params,
      bool formdata = false,
      bool formEncoded = false}) {
    return _api.dio.put(
      route,
      data: body,
      queryParameters: params,
    );
  }
}
