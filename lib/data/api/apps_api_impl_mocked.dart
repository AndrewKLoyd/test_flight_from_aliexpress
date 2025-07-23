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
  Future<Response> getAppsWithAppId(String appId) => Future.delayed(
    const Duration(seconds: 2),
    () => Response(
      requestOptions: RequestOptions(),
      data: [
        {
          "appId": "com.example.app",
          "appName": "Name",
          "versionCode": "1.1",
          "buildNumber": 1231,
          "description": "Hello mate nice app",
          "dateUploaded": "2025-07-21 22:31:43.121",
        },
        {
          "appId": "com.example.app",
          "appName": "Name",
          "versionCode": "1.1",
          "buildNumber": 1231,
          "description": "Hello mate nice app",
          "dateUploaded": "2025-07-21 22:31:43.121",
        },
        {
          "appId": "com.example.app",
          "appName": "Name",
          "versionCode": "1.1",
          "buildNumber": 1231,
          "description": "Hello mate nice app",
          "dateUploaded": "2025-07-21 22:31:43.121",
        },
        {
          "appId": "com.example.app",
          "appName": "Name",
          "versionCode": "1.1",
          "buildNumber": 1231,
          "description": "Hello mate nice app",
          "dateUploaded": "2025-07-21 22:31:43.121",
        },
        {
          "appId": "com.example.app",
          "appName": "Name",
          "versionCode": "1.1",
          "buildNumber": 1231,
          "description": "Hello mate nice app",
          "dateUploaded": "2025-07-21 22:31:43.121",
        },
        {
          "appId": "com.example.app",
          "appName": "Name",
          "versionCode": "1.1",
          "buildNumber": 1231,
          "description": "Hello mate nice app",
          "dateUploaded": "2025-07-21 22:31:43.121",
        },
      ],
    ),
  );

  @override
  Future<Response> getBuild(
    String appId,
    String versionCode,
    int buildNumber,
  ) => Future.delayed(
    const Duration(seconds: 2),
    () => Response(
      requestOptions: RequestOptions(),
      data: {
        "appName": "Medlike",
        "appId": "com.example.app",
        "versionCode": '1.2',
        "buildNumber": 2412,
        "description": "Added some stuff and many stupit stuff",
        "downloadUrl":
            'https://code.visualstudio.com/sha/download?build=stable&os=darwin-universal',
      },
    ),
  );
}
