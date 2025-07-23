import 'package:kinda_test_fairy/core/common/result.dart';
import 'package:kinda_test_fairy/domain/entities/app_entity.dart';

abstract interface class AppsRepository {
  Future<Result<Iterable<AppEntity>, String>> getApps({String? appId});
}
