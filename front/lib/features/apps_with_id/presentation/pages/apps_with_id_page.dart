import 'package:flutter/material.dart';
import 'package:kinda_test_fairy/core/widgets/core_scaffold.dart';
import 'package:kinda_test_fairy/features/apps_with_id/domain/view_model/app_with_id_view_model.dart';
import 'package:kinda_test_fairy/features/apps_with_id/presentation/widgets/app_with_id_tile_widget.dart';

class AppsWithIdPage extends StatelessWidget {
  const AppsWithIdPage({super.key, required this.viewModel});
  final AppWithIdViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: viewModel.getApps,
      child: ListenableBuilder(
        listenable: viewModel,
        builder: (context, child) {
          final state = viewModel.state;
          return CoreScaffold(
            title: switch (state) {
              AppWithIdDataState() => state.apps.first.appName,
              _ => "",
            },
            child: switch (state) {
              AppWithIdExceptionState() => Center(
                child: Text(state.exception),
              ),
              AppWithIdDataState() => GridView(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 400,
                  mainAxisExtent: 150,
                ),
                children: state.apps
                    .map(
                      (e) => AppWithIdTileWidget(app: e),
                    )
                    .toList(),
              ),

              _ => Center(
                child: CircularProgressIndicator(),
              ),
            },
          );
        },
      ),
    );
  }
}
