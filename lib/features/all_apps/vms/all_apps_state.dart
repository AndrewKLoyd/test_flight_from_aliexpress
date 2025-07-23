import 'package:kinda_test_fairy/domain/entities/app_entity.dart';

sealed class AllAppsState {
  const AllAppsState();
}

final class AllAppsInitialState extends AllAppsState {
  const AllAppsInitialState();
}

final class AllAppsLoadingState extends AllAppsState {
  const AllAppsLoadingState();
}

final class AllAppsDataState extends AllAppsState {
  final Iterable<AppEntity> apps;

  const AllAppsDataState({required this.apps});
}

final class AllAppsExceptionState extends AllAppsState {
  final String exception;

  const AllAppsExceptionState({required this.exception});
}
