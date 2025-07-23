class AppEntity {
  final String appId;
  final String appName;
  final String currentVersionCode;
  final num currentBuildNumber;
  final String? lastBuildDescription;
  final String lastBuildReleased;

  AppEntity({
    required this.appId,
    required this.appName,
    required this.currentVersionCode,
    required this.currentBuildNumber,
    required this.lastBuildDescription,
    required this.lastBuildReleased,
  });
}
