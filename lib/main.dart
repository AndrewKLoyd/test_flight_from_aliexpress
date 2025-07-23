import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kinda_test_fairy/core/messaging_service/messaging_service.dart';
import 'package:kinda_test_fairy/data/api/apps_api_impl_mocked.dart';
import 'package:kinda_test_fairy/domain/api/apps_api.dart';
import 'package:kinda_test_fairy/features/all_apps/data/repository/apps_repository_impl.dart';
import 'package:kinda_test_fairy/features/all_apps/pages/all_apps_page.dart';
import 'package:kinda_test_fairy/features/all_apps/domain/vms/all_apps_view_model.dart';
import 'package:kinda_test_fairy/features/app_build/data/repository/app_build_repo_impl.dart';
import 'package:kinda_test_fairy/features/app_build/domain/view_models/app_build_view_model.dart';
import 'package:kinda_test_fairy/features/app_build/pages/app_build_page.dart';
import 'package:kinda_test_fairy/features/apps_with_id/data/repository/app_with_id_repo_impl.dart';
import 'package:kinda_test_fairy/features/apps_with_id/domain/view_model/app_with_id_view_model.dart';
import 'package:kinda_test_fairy/features/apps_with_id/presentation/pages/apps_with_id_page.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  final messagingService = MessagingService();
  final dio = Dio();
  final appsApi = AppsApiImplMocked();
  //  AppsApiImpl(dio: dio)

  runApp(
    MaterialApp.router(
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
            TargetPlatform.linux: CupertinoPageTransitionsBuilder(),
            TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      routerConfig: GoRouter(
        initialLocation: "/",
        debugLogDiagnostics: true,
        routes: [
          ShellRoute(
            builder: (context, state, child) => Scaffold(
              body: MultiProvider(
                providers: [
                  Provider<Dio>.value(value: dio),
                  Provider<MessagingService>.value(value: messagingService),
                  Provider<AppsApi>.value(
                    value: appsApi,
                  ),
                ],
                builder: (context, child) => child ?? const SizedBox(),
                child: child,
              ),
            ),
            routes: [
              GoRoute(
                path: "/",
                name: "all-apps",
                builder: (context, state) =>
                    ListenableProvider<AllAppsViewModel>(
                      create: (context) => AllAppsViewModel(
                        repo: AppsRepositoryImpl(
                          appsApi: Provider.of(context, listen: false),
                        ),
                      )..getApps(),
                      builder: (context, child) => AllAppsPage(
                        appsViewModel: Provider.of(context, listen: false),
                      ),
                    ),
                routes: [
                  GoRoute(
                    path: ":appId",
                    name: "apps-with-id",
                    builder: (context, state) => ListenableProvider(
                      create: (context) => AppWithIdViewModel(
                        repo: AppWithIdRepoImpl(
                          appsApi: Provider.of(context, listen: false),
                        ),
                        appId: state.pathParameters["appId"] ?? "Empty",
                      )..getApps(),
                      builder: (context, child) => AppsWithIdPage(
                        viewModel: Provider.of(context, listen: false),
                      ),
                    ),
                    routes: [
                      GoRoute(
                        path: "build",
                        name: "app-build",
                        builder: (context, state) => ListenableProvider(
                          create: (context) => AppBuildViewModel(
                            appId: state.pathParameters["appId"] ?? "Empty",
                            versionCode:
                                state.uri.queryParameters["versionCode"] ?? "",
                            buildNumber: int.parse(
                              state.uri.queryParameters["buildNumber"] ?? "0",
                            ),
                            repo: AppBuildRepoImpl(
                              api: Provider.of(context, listen: false),
                            ),
                          )..getApps(),
                          builder: (context, child) => AppBuildPage(
                            viewModel: Provider.of(context, listen: false),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
