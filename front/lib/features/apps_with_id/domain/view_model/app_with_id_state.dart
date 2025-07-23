part of 'app_with_id_view_model.dart';

sealed class AppWithIdState {
  const AppWithIdState();
}

final class AppWithIdInitialState extends AppWithIdState {
  const AppWithIdInitialState();
}

final class AppWithIdLoadingState extends AppWithIdState {
  const AppWithIdLoadingState();
}

final class AppWithIdDataState extends AppWithIdState {
  final Iterable<AppWithId> apps;

  const AppWithIdDataState({required this.apps});
}

final class AppWithIdExceptionState extends AppWithIdState {
  final String exception;

  const AppWithIdExceptionState({required this.exception});
}
