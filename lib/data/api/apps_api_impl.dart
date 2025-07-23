import 'package:dio/dio.dart';
import 'package:kinda_test_fairy/domain/api/apps_api.dart';

final class AppsApiImpl implements AppsApi {
  final Dio _dio;

  AppsApiImpl({required Dio dio}) : _dio = dio;
  @override
  Future<Response> getAllApps() async => await _dio.get("/apps");

  @override
  Future<Response> getAppsWithAppId(String appId) async =>
      await _dio.get("/apps/$appId");
}
