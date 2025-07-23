import 'package:flutter/material.dart';
import 'package:kinda_test_fairy/core/widgets/core_scaffold.dart';
import 'package:kinda_test_fairy/features/app_build/domain/view_models/app_build_view_model.dart';
import 'package:url_launcher/url_launcher.dart';

class AppBuildPage extends StatelessWidget {
  const AppBuildPage({
    super.key,
    required this.viewModel,
  });

  final AppBuildViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        final state = viewModel.state;
        return CoreScaffold(
          title: switch (state) {
            AppBuildDataState() =>
              "${state.build.appName}(${state.build.versionCode}-${state.build.buildNumber})",
            _ => "",
          },
          child: switch (state) {
            AppBuildDataState() => Align(
              alignment: Alignment.center,
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(16),
                  width: 300,
                  height: 200,
                  child: Column(
                    spacing: 12,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "${state.build.appName}(${state.build.versionCode} - ${state.build.buildNumber})",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () =>
                                launchUrl(Uri.parse(state.build.downloadUrl)),
                            icon: Icon(Icons.download),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),
                      Text("Description: ${state.build.description}"),
                    ],
                  ),
                ),
              ),
            ),
            AppBuildExceptionState() => Center(
              child: Text(state.exception),
            ),
            _ => Center(
              child: CircularProgressIndicator(),
            ),
          },
        );
      },
    );
  }
}
