import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:injectable/injectable.dart';
import 'package:mvvm_project/core/api/interceptors.dart';
import 'package:mvvm_project/core/constants/urls.dart';
import 'package:mvvm_project/core/constants/values.dart';

@dev
@LazySingleton()
class Api {
  late Dio dio = createDio();
  Api._internal();

  static final Api _singleton = Api._internal();
  static bool requiresToken = true;

  factory Api() => _singleton;

  static Dio createDio() {
    var dio = Dio(
      BaseOptions(
        baseUrl: Urls.baseUrl,
        receiveTimeout: const Duration(seconds: Values.requestDuration),
        connectTimeout: const Duration(seconds: Values.requestDuration),
        sendTimeout: const Duration(seconds: Values.requestDuration),
      ),
    );

    dio.interceptors.addAll(
      {
        AppInterceptor(),
        DioCacheInterceptor(
          options: CacheOptions(
            store: MemCacheStore(maxEntrySize: 1000000, maxSize: 5000000),
            policy: CachePolicy.request,
            maxStale: const Duration(days: 30),
            priority: CachePriority.high,
            cipher: null,
            keyBuilder: CacheOptions.defaultCacheKeyBuilder,
            allowPostMethod: false,
          ),
        ),
      },
    );
    return dio;
  }
}
