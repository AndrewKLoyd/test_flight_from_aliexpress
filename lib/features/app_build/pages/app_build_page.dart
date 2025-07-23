import 'package:flutter/material.dart';
import 'package:kinda_test_fairy/core/messaging_service/messaging_service.dart';

class AppBuildPage extends StatelessWidget {
  const AppBuildPage({
    super.key,
    required this.versionCode,
    required this.buildNumber,
  });
  final String versionCode;
  final String buildNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          child: SizedBox(
            width: 250,
            height: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(versionCode),
                Text(buildNumber),
                IconButton(
                  onPressed: () {
                    MessagingService.of(
                      context,
                    ).showMessage(context, message: "Downloading app");
                  },
                  icon: Icon(Icons.download_sharp),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
