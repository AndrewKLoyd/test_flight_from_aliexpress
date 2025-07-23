import 'package:dio/dio.dart';
import 'package:kinda_test_fairy/domain/api/apps_api.dart';

final class AppsApiImpl implements AppsApi {
  final Dio _dio;

  AppsApiImpl({required Dio dio}) : _dio = dio;
  @override
  Future<Response> getAllApps() => _dio.get("/apps");

  @override
  Future<Response> getAppsWithAppId(String appId) => _dio.get("/apps/$appId");

  @override
  Future<Response> getBuild(
    String appId,
    String versionCode,
    int buildNumber,
  ) => _dio.get(
    "/apps/$appId/build",
    queryParameters: {
      "appId": appId,
      "versionCode": versionCode,
      "buildNumber": buildNumber,
    },
  );
}
