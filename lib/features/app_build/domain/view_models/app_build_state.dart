part of "app_build_view_model.dart";

sealed class AppBuildState {
  const AppBuildState();
}

final class AppBuildInitialState extends AppBuildState {
  const AppBuildInitialState();
}

final class AppBuildLoadingState extends AppBuildState {
  const AppBuildLoadingState();
}

final class AppBuildDataState extends AppBuildState {
  final AppBuildEntity build;

  const AppBuildDataState({required this.build});
}

final class AppBuildExceptionState extends AppBuildState {
  final String exception;

  const AppBuildExceptionState({required this.exception});
}
