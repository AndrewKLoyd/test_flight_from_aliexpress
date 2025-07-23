import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kinda_test_fairy/features/apps_with_id/domain/entities/app_with_id.dart';

class AppWithIdTileWidget extends StatelessWidget {
  const AppWithIdTileWidget({super.key, required this.app});
  final AppWithId app;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => context.goNamed(
        "app-build",
        pathParameters: {"appId": app.appId},
        queryParameters: {
          "versionCode": app.versionCode,
          "buildNumber": app.buildNumber.toString(),
        },
      ),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 12,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    app.appName,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),

                  Text(
                    "${app.versionCode}(${app.buildNumber})",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              Text(
                app.appId,
                style: Theme.of(context).textTheme.bodySmall,
              ),

              Text(app.description.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
