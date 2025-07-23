class AppWithId {
  final String appId;
  final String appName;
  final String? description;
  final String dateUploaded;
  final String versionCode;
  final int buildNumber;

  AppWithId({
    required this.appId,
    required this.appName,
    required this.description,
    required this.dateUploaded,
    required this.versionCode,
    required this.buildNumber,
  });
}
