import 'package:dio/dio.dart';
import 'package:kinda_test_fairy/core/common/result.dart';
import 'package:kinda_test_fairy/data/dtos/app_dto.dart';
import 'package:kinda_test_fairy/domain/api/apps_api.dart';
import 'package:kinda_test_fairy/domain/entities/app_entity.dart';
import 'package:kinda_test_fairy/domain/repository/apps_repository.dart';

final class AppsRepositoryImpl implements AppsRepository {
  final AppsApi _appsApi;

  AppsRepositoryImpl({required AppsApi appsApi}) : _appsApi = appsApi;

  @override
  Future<Result<Iterable<AppEntity>, String>> getApps({String? appId}) async {
    try {
      final Response response;
      if (appId == null) {
        response = await _appsApi.getAllApps();
      } else {
        response = await _appsApi.getAppsWithAppId(appId);
      }
      final Iterable<AppEntity> result = (response.data as List).map(
        (e) => AppDto.fromJson(e) as AppEntity,
      );
      return Result.ok(result);
    } catch (e) {
      return Result.exception(e.toString());
    }
  }
}
