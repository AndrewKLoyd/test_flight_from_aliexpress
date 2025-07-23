import 'package:kinda_test_fairy/core/common/result.dart';
import 'package:kinda_test_fairy/domain/api/apps_api.dart';
import 'package:kinda_test_fairy/features/app_build/data/dtos/app_build_dto.dart';
import 'package:kinda_test_fairy/features/app_build/domain/entity/app_build_entity.dart';
import 'package:kinda_test_fairy/features/app_build/domain/repository/app_build_repo.dart';

final class AppBuildRepoImpl implements AppBuildRepo {
  final AppsApi _api;

  AppBuildRepoImpl({required AppsApi api}) : _api = api;
  @override
  Future<void> downloadBuild(String link) async {}

  @override
  Future<Result<AppBuildEntity, String>> getBuildData(
    String appId,
    String versionCode,
    int buildNumber,
  ) async {
    try {
      final response = await _api.getBuild(appId, versionCode, buildNumber);
      return Result.ok(AppBuildDto.fromJson(response.data) as AppBuildEntity);
    } catch (e) {
      return Result.exception(e.toString());
    }
  }
}
