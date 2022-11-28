import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/domain/entities/user_profile.dart';
import 'package:totaltest/presentation/providers/admin_provider.dart';
import 'package:totaltest/presentation/screens/admin_details/admin_details.dart';
import 'package:totaltest/presentation/screens/admin_overview/admin_overview_view_model.dart';
import 'package:totaltest/presentation/screens/admin_overview/state/admin_overview_view_state.dart';

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
      ),
    );

    _viewModel = ref.read(adminOverviewViewModel.notifier);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Admin Overview")),
      body: Builder(
        builder: (context) {
          AdminOverviewViewState state =
              ref.watch<AdminOverviewViewState>(adminOverviewViewModel);

          return state.when(
            init: () => Container(),
            loading: () => const Center(
              child: CircularProgressIndicator(),
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
          );
        },
      ),
    );
  }
}
