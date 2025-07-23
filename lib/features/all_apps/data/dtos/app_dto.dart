import 'package:intl/intl.dart';
import 'package:kinda_test_fairy/features/all_apps/domain/entities/app_entity.dart';

final class AppDto extends AppEntity {
  AppDto({
    required super.appId,
    required super.appName,
    required super.currentVersionCode,
    required super.currentBuildNumber,
    required super.lastBuildDescription,
    required String lastBuildReleased,
  }) : super(
         lastBuildReleased:
             DateFormat(
               "HH:mm dd.MM.yyyy",
             ).format(
               DateTime.parse(lastBuildReleased),
             ),
       );

  factory AppDto.fromJson(Map<String, dynamic> json) => AppDto(
    appId: json["appId"],
    appName: json["appName"],
    currentVersionCode: json["currentVersionCode"],
    currentBuildNumber: json["currentBuildNumber"],
    lastBuildDescription: json["lastBuildDescription"],
    lastBuildReleased: json["lastBuildReleased"],
  );

  Map<String, dynamic> toJson() => {
    "appId": appId,
    "appName": appName,
    "currentVersionCode": currentVersionCode,
    "currentBuildNumber": currentBuildNumber,
    "lastBuildDescription": lastBuildDescription,
    "lastBuildReleased": lastBuildReleased,
  };
}
