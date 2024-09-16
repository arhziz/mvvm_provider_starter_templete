import 'package:dio/dio.dart';

abstract class IHttpClient {

  Future<Response> getHttp(String route, {Map<String, dynamic>? body, Map<String, dynamic>? params, bool formdata = false});

  Future<Response> postHttp(String route, dynamic body, {Map<String, dynamic>? params, bool formdata = false, bool formEncoded = false, void Function({int count, int total})? onSendProgress, void Function({int count, int total})? onRecieveProgress});

  Future<Response> putHttp(String route, dynamic body, {Map<String, dynamic>? params, bool formdata = false, bool formEncoded = false});

  Future<Response> deleteHttp(String route, dynamic body, {Map<String, dynamic>? params});

  Future<Response> makeRequest(Future<Response> future);
}
