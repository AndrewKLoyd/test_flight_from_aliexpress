import 'package:flutter/material.dart';
import 'package:kinda_test_fairy/core/common/result.dart';
import 'package:kinda_test_fairy/features/app_build/domain/entity/app_build_entity.dart';
import 'package:kinda_test_fairy/features/app_build/domain/repository/app_build_repo.dart';
part "app_build_state.dart";

final class AppBuildViewModel extends ChangeNotifier {
  final String _appId;
  final String _versionCode;
  final int buildNumber;
  final AppBuildRepo _repo;

  AppBuildState state = const AppBuildInitialState();

  AppBuildViewModel({
    required String appId,
    required String versionCode,
    required this.buildNumber,
    required AppBuildRepo repo,
  }) : _appId = appId,
       _versionCode = versionCode,
       _repo = repo;

  Future<void> getApps() async {
    if (state is AppBuildLoadingState) return;
    state = const AppBuildLoadingState();
    notifyListeners();
    final result = await _repo.getBuildData(_appId, _versionCode, buildNumber);
    switch (result) {
      case Exception<AppBuildEntity, String>():
        state = AppBuildExceptionState(exception: result.exception);
        break;
      case Ok<AppBuildEntity, String>():
        state = AppBuildDataState(build: result.data);
        break;
    }
    notifyListeners();
  }
}
