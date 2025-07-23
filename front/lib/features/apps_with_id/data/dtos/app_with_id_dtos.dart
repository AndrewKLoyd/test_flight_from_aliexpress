import 'package:intl/intl.dart';
import 'package:kinda_test_fairy/features/apps_with_id/domain/entities/app_with_id.dart';

class AppWithIdDtos extends AppWithId {
  AppWithIdDtos({
    required super.appId,
    required super.description,
    required super.appName,
    required String dateUploaded,
    required super.versionCode,
    required super.buildNumber,
  }) : super(
         dateUploaded:
             DateFormat(
               "HH:mm dd.MM.yyyy",
             ).format(
               DateTime.parse(dateUploaded),
             ),
       );

  factory AppWithIdDtos.fromJson(Map<String, dynamic> json) => AppWithIdDtos(
    appId: json["appId"],
    appName: json["appName"],
    versionCode: json["versionCode"],
    buildNumber: json["buildNumber"],
    description: json["description"],
    dateUploaded: json["dateUploaded"],
  );

  Map<String, dynamic> toJson() => {
    "appId": appId,
    "appName": appName,
    "versionCode": versionCode,
    "buildNumber": buildNumber,
    "description": description,
    "dateUploaded": dateUploaded,
  };
}
