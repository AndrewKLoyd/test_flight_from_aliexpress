class AppBuildEntity {
  final String appName;
  final String appId;
  final String versionCode;
  final int buildNumber;
  final String description;
  final String downloadUrl;

  const AppBuildEntity({
    required this.appName,
    required this.appId,
    required this.versionCode,
    required this.buildNumber,
    required this.description,
    required this.downloadUrl,
  });
}
