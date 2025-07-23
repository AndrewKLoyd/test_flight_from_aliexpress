import 'package:kinda_test_fairy/core/common/result.dart';
import 'package:kinda_test_fairy/domain/api/apps_api.dart';
import 'package:kinda_test_fairy/features/apps_with_id/data/dtos/app_with_id_dtos.dart';
import 'package:kinda_test_fairy/features/apps_with_id/domain/entities/app_with_id.dart';
import 'package:kinda_test_fairy/features/apps_with_id/domain/repository/app_with_id_repo.dart';

final class AppWithIdRepoImpl implements AppWithIdRepo {
  final AppsApi _appsApi;

  AppWithIdRepoImpl({required AppsApi appsApi}) : _appsApi = appsApi;

  @override
  Future<Result<Iterable<AppWithId>, String>> getApps(String appId) async {
    try {
      final respose = await _appsApi.getAppsWithAppId(appId);
      final result = (respose.data as List).map(
        (e) => AppWithIdDtos.fromJson(e),
      );
      return Result.ok(result);
    } catch (e) {
      return Result.exception(e.toString());
    }
  }
}
