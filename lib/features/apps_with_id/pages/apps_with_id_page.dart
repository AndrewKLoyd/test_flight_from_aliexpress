import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppsWithIdPage extends StatelessWidget {
  const AppsWithIdPage({super.key, required this.appId});
  final String appId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appId),
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () => context.goNamed(
            "app-build",
            pathParameters: {
              "appId": appId,
            },
            queryParameters: {
              "versionCode": "1.2",
              "buildNumber": "1324",
            },
          ),
          child: Text(appId),
        ),
      ),
    );
  }
}
