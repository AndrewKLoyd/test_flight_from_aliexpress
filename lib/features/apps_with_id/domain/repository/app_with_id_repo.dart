import 'package:kinda_test_fairy/core/common/result.dart';
import 'package:kinda_test_fairy/features/apps_with_id/domain/entities/app_with_id.dart';

abstract interface class AppWithIdRepo {
  Future<Result<Iterable<AppWithId>, String>> getApps(String appId);
}
