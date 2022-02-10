import 'package:dio/dio.dart';

abstract class IApi<R> {
  Future<R> get(String path, {Map<String, dynamic>? queryParameters});
  Future<R> post(String path, {Map<String, dynamic>? data});
  Future<R> put(String path, {Map<String, dynamic>? data});
  Future<R> del(String path, {Map<String, dynamic>? data});
  Map<String, dynamic> get headers;
  String get contentType;
  String get baseUrl;
  set headers(Map<String, dynamic> value);
  set contentType(String value);
  set baseUrl(String value);
}

class DioApi implements IApi<Response> {
  final Dio _dio;
  DioApi({required String baseUrl}) : _dio = Dio(BaseOptions(baseUrl: baseUrl));

  @override
  String get baseUrl => _dio.options.baseUrl;

  @override
  String get contentType => _dio.options.contentType ?? "Null";

  @override
  Map<String, dynamic> get headers => _dio.options.headers;

  @override
  set headers(Map<String, dynamic> value) => _dio.options.headers = value;

  @override
  set contentType(String value) => _dio.options.contentType = value;

  @override
  set baseUrl(String value) => _dio.options.baseUrl = value;

  @override
  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    return await _dio.get(path, queryParameters: queryParameters);
  }

  @override
  Future<Response> post(String path, {Map<String, dynamic>? data}) async {
    return await _dio.post(path, data: data);
  }

  @override
  Future<Response> put(String path, {Map<String, dynamic>? data}) async {
    return await _dio.put(path, data: data);
  }

  @override
  Future<Response> del(String path, {Map<String, dynamic>? data}) async {
    return await _dio.delete(path, data: data);
  }
}
