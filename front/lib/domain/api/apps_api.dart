import 'package:dio/dio.dart';

abstract interface class AppsApi {
  Future<Response> getAllApps();
  Future<Response> getAppsWithAppId(String appId);
  Future<Response> getBuild(String appId, String versionCode, int buildNumber);
}
