import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/domain/entities/user_profile.dart';
import 'package:totaltest/domain/providers/admin/admin_provider.dart';
import 'package:totaltest/domain/providers/app_user/app_user_provider.dart';
import 'package:totaltest/presentation/screens/admin_details/admin_details.dart';
import 'package:totaltest/presentation/screens/admin_overview/admin_overview_view_model.dart';
import 'package:totaltest/presentation/screens/admin_overview/state/admin_overview_view_state.dart';
import 'package:totaltest/presentation/shared_widgets/loading_indicator.dart';

class AdminOverview extends ConsumerStatefulWidget {
  const AdminOverview({Key? key}) : super(key: key);

  @override
  AdminOverviewState createState() => AdminOverviewState();
}

class AdminOverviewState extends ConsumerState<AdminOverview> {
  late final StateNotifierProvider<AdminOverviewViewModel,
      AdminOverviewViewState> adminOverviewViewModel;
  late AdminOverviewViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    adminOverviewViewModel =
        StateNotifierProvider<AdminOverviewViewModel, AdminOverviewViewState>(
      (ref) => AdminOverviewViewModel(
        ref.read(adminProvider.notifier),
        ref.read(appUserProvider.notifier),
      ),
    );

    _viewModel = ref.read(adminOverviewViewModel.notifier);
  }

  @override
  Widget build(BuildContext context) {
    AdminOverviewViewState state =
        ref.watch<AdminOverviewViewState>(adminOverviewViewModel);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Overview"),
        actions: state.maybeWhen(
          ready: (_) => [
            IconButton(
              onPressed: () => _viewModel.logOut(),
              icon: const Icon(Icons.exit_to_app),
            ),
          ],
          orElse: () => null,
        ),
      ),
      body: Builder(
        builder: (context) {
          return state.maybeWhen(
            loading: () => const Center(
              child: LoadingIndicators.basicLoadingIndicator,
            ),
            error: (errorText) => Center(child: Text(errorText)),
            ready: (users) => Scaffold(
              body: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final UserProfile _profile = users[index];
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text('${index + 1}. ${_profile.userId}'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AdminDetailsScreen(
                                uid: _profile.userId,
                              ),
                            ),
                          );
                        },
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                    ],
                  );
                },
              ),
            ),
            orElse: () => Container(),
          );
        },
      ),
    );
  }
}
