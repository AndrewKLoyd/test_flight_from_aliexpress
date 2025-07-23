import 'package:flutter/material.dart';
import 'package:kinda_test_fairy/core/common/result.dart';
import 'package:kinda_test_fairy/features/all_apps/domain/entities/app_entity.dart';
import 'package:kinda_test_fairy/features/all_apps/domain/repository/apps_repository.dart';
import 'package:kinda_test_fairy/features/all_apps/domain/vms/all_apps_state.dart';

final class AllAppsViewModel extends ChangeNotifier {
  final AppsRepository _repo;

  AllAppsState state = const AllAppsInitialState();

  AllAppsViewModel({required AppsRepository repo}) : _repo = repo;

  Future<void> getApps() async {
    if (state is AllAppsLoadingState) return;
    state = const AllAppsLoadingState();
    notifyListeners();
    final result = await _repo.getApps();
    switch (result) {
      case Exception<Iterable<AppEntity>, String>():
        state = AllAppsExceptionState(exception: result.exception);
        break;
      case Ok<Iterable<AppEntity>, String>():
        state = AllAppsDataState(apps: result.data);
        break;
    }
    notifyListeners();
  }
}
