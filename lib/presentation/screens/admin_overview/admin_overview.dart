import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/domain/entities/user_profile.dart';
import 'package:totaltest/presentation/screens/admin_details/admin_details.dart';
import 'package:totaltest/presentation/screens/admin_overview/admin_overview_view_model.dart';

class AdminOverview extends ConsumerStatefulWidget {
  const AdminOverview({Key? key}) : super(key: key);

  @override
  AdminOverviewState createState() => AdminOverviewState();
}

class AdminOverviewState extends ConsumerState<AdminOverview> {
  late final AdminOverviewViewModel _viewModel;
  @override
  void initState() {
    _viewModel = ref.read(adminOverviewViewModel);
    _viewModel.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(adminOverviewViewModel);
    return Scaffold(
      appBar: AppBar(title: const Text("Admin Overview")),
      body: _viewModel.loading
          ? const Center(
              child: SizedBox(
                  height: 50, width: 50, child: CircularProgressIndicator()))
          : ListView.builder(
              itemCount: _viewModel.users.length,
              itemBuilder: (context, index) {
                final UserProfile _profile = _viewModel.users[index];
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
    );
  }
}
