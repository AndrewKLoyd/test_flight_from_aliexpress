import 'package:flutter/material.dart';
import 'package:kinda_test_fairy/features/all_apps/vms/all_apps_state.dart';
import 'package:kinda_test_fairy/features/all_apps/vms/all_apps_view_model.dart';
import 'package:kinda_test_fairy/features/all_apps/widgets/app_tile.dart';

class AllAppsPage extends StatelessWidget {
  final AllAppsViewModel _appsViewModel;

  const AllAppsPage({super.key, required AllAppsViewModel appsViewModel})
    : _appsViewModel = appsViewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Все приложения"),
      ),
      body: RefreshIndicator(
        onRefresh: _appsViewModel.getApps,
        child: ListenableBuilder(
          listenable: _appsViewModel,
          builder: (context, child) {
            final state = _appsViewModel.state;
            return switch (state) {
              AllAppsExceptionState() => Center(child: Text(state.exception)),
              AllAppsDataState() => GridView(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 400,
                  mainAxisExtent: 150,
                ),

                children: state.apps.map((e) => AppTile(appEntity: e)).toList(),
              ),
              _ => Center(child: CircularProgressIndicator()),
            };
          },
        ),
      ),
    );
  }
}
