import 'package:dio/dio.dart';
import 'package:kinda_test_fairy/domain/api/apps_api.dart';

final class AppsApiImplMocked implements AppsApi {
  AppsApiImplMocked();
  @override
  Future<Response> getAllApps() => Future.delayed(
    const Duration(seconds: 2),
    () => Response(
      requestOptions: RequestOptions(),
      data: [
        {
          "appId": "com.example.app",
          "appName": "Name",
          "currentVersionCode": "1.1",
          "currentBuildNumber": 1231,
          "lastBuildDescription": "Hello mate nice app",
          "lastBuildReleased": "2025-07-21 22:31:43.121",
        },
        {
          "appId": "com.example.app",
          "appName": "Name",
          "currentVersionCode": "1.1",
          "currentBuildNumber": 1231,
          "lastBuildDescription": "Hello mate nice app",
          "lastBuildReleased": "2025-07-21 22:31:43.121",
        },
        {
          "appId": "com.example.app",
          "appName": "Name",
          "currentVersionCode": "1.1",
          "currentBuildNumber": 1231,
          "lastBuildDescription": "Hello mate nice app",
          "lastBuildReleased": "2025-07-21 22:31:43.121",
        },
        {
          "appId": "com.example.app",
          "appName": "Name",
          "currentVersionCode": "1.1",
          "currentBuildNumber": 1231,
          "lastBuildDescription": "Hello mate nice app",
          "lastBuildReleased": "2025-07-21 22:31:43.121",
        },
        {
          "appId": "com.example.app",
          "appName": "Name",
          "currentVersionCode": "1.1",
          "currentBuildNumber": 1231,
          "lastBuildDescription": "Hello mate nice app",
          "lastBuildReleased": "2025-07-21 22:31:43.121",
        },
      ],
    ),
  );

  @override
  Future<Response> getAppsWithAppId(String appId) => getAllApps();
}
