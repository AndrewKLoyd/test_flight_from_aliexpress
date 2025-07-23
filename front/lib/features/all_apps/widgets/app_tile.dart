import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kinda_test_fairy/features/all_apps/domain/entities/app_entity.dart';

class AppTile extends StatelessWidget {
  const AppTile({super.key, required this.appEntity});
  final AppEntity appEntity;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => context.goNamed(
        "apps-with-id",
        pathParameters: {"appId": appEntity.appId},
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
                    appEntity.appName,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),

                  Text(
                    "${appEntity.currentVersionCode}(${appEntity.currentBuildNumber})",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              Text(
                appEntity.appId,
                style: Theme.of(context).textTheme.bodySmall,
              ),

              Text(appEntity.lastBuildReleased),
            ],
          ),
        ),
      ),
    );
  }
}
