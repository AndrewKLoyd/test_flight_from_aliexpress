import 'package:kinda_test_fairy/core/common/result.dart';
import 'package:kinda_test_fairy/features/app_build/domain/entity/app_build_entity.dart';

abstract interface class AppBuildRepo {
  Future<Result<AppBuildEntity, String>> getBuildData(
    String appId,
    String versionCode,
    int buildNumber,
  );
  Future<void> downloadBuild(String link);
}
