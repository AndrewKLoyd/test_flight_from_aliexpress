import 'package:dio/dio.dart';

abstract interface class AppsApi {
  Future<Response> getAllApps();
  Future<Response> getAppsWithAppId(String appId);
}
