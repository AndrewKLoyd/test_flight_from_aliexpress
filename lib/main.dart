import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kinda_test_fairy/core/messaging_service/messaging_service.dart';
import 'package:kinda_test_fairy/data/api/apps_api_impl.dart';
import 'package:kinda_test_fairy/data/api/apps_api_impl_mocked.dart';
import 'package:kinda_test_fairy/data/repository/apps_repository_impl.dart';
import 'package:kinda_test_fairy/domain/repository/apps_repository.dart';
import 'package:kinda_test_fairy/features/all_apps/pages/all_apps_page.dart';
import 'package:kinda_test_fairy/features/all_apps/vms/all_apps_view_model.dart';
import 'package:kinda_test_fairy/features/app_build/pages/app_build_page.dart';
import 'package:kinda_test_fairy/features/apps_with_id/pages/apps_with_id_page.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  final messagingService = MessagingService();
  final dio = Dio();
  final appRepo = AppsRepositoryImpl(
    appsApi: AppsApiImplMocked(),
    //  AppsApiImpl(dio: dio)
  );

  runApp(
    MaterialApp.router(
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
                  Provider<AppsRepository>.value(value: appRepo),
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
                        repo: Provider.of(context, listen: false),
                      )..getApps(),
                      builder: (context, child) => AllAppsPage(
                        appsViewModel: Provider.of(context, listen: false),
                      ),
                    ),
                routes: [
                  GoRoute(
                    path: ":appId",
                    name: "apps-with-id",
                    builder: (context, state) => AppsWithIdPage(
                      appId: state.pathParameters["appId"] ?? "Empty",
                    ),
                    routes: [
                      GoRoute(
                        path: "build",
                        name: "app-build",
                        builder: (context, state) => AppBuildPage(
                          versionCode:
                              state.uri.queryParameters["versionCode"] ?? "",
                          buildNumber:
                              state.uri.queryParameters["buildNumber"] ?? "",
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
