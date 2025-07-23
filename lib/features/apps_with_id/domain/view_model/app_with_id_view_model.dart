import 'package:flutter/material.dart';
import 'package:kinda_test_fairy/core/common/result.dart';
import 'package:kinda_test_fairy/features/apps_with_id/domain/entities/app_with_id.dart';
import 'package:kinda_test_fairy/features/apps_with_id/domain/repository/app_with_id_repo.dart';

part 'app_with_id_state.dart';

final class AppWithIdViewModel extends ChangeNotifier {
  final AppWithIdRepo _repo;
  final String _appId;

  AppWithIdViewModel({required AppWithIdRepo repo, required String appId})
    : _repo = repo,
      _appId = appId;

  AppWithIdState state = const AppWithIdInitialState();

  Future<void> getApps() async {
    if (state is AppWithIdLoadingState) return;
    state = const AppWithIdLoadingState();
    notifyListeners();
    final result = await _repo.getApps(_appId);
    switch (result) {
      case Exception<Iterable<AppWithId>, String>():
        state = AppWithIdExceptionState(exception: result.exception);
      case Ok<Iterable<AppWithId>, String>():
        state = AppWithIdDataState(apps: result.data);
    }
    notifyListeners();
  }
}
