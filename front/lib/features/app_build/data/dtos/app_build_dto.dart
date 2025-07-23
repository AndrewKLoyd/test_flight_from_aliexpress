import 'package:kinda_test_fairy/features/app_build/domain/entity/app_build_entity.dart';

final class AppBuildDto extends AppBuildEntity {
  AppBuildDto({
    required super.appName,
    required super.appId,
    required super.versionCode,
    required super.buildNumber,
    required super.description,
    required super.downloadUrl,
  });

  factory AppBuildDto.fromJson(Map<String, dynamic> json) => AppBuildDto(
    appId: json["appId"],
    appName: json["appName"],
    versionCode: json["versionCode"],
    buildNumber: json["buildNumber"],
    description: json["description"],
    downloadUrl: json["downloadUrl"],
  );
}
