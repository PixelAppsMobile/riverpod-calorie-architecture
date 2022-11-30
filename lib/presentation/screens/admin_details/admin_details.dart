import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/domain/providers/admin/admin_provider.dart';
import 'package:totaltest/domain/providers/food_consumption/admin_food_consumption_provider.dart';
import 'package:totaltest/presentation/screens/admin_details/admin_details_view_model.dart';
import 'package:totaltest/presentation/screens/admin_details/state/admin_details_view_state.dart';
import 'package:totaltest/presentation/screens/admin_details/widgets/food_entries_tab/food_entries_tab.dart';
import 'package:totaltest/presentation/screens/admin_details/widgets/stats_tab/stats_tab.dart';
import 'package:totaltest/presentation/screens/admin_details/widgets/update_food_entry_bottom_sheet/update_food_entry_bottom_sheet.dart';

class AdminDetailsScreen extends ConsumerStatefulWidget {
  const AdminDetailsScreen({
    Key? key,
    required this.uid,
  }) : super(key: key);

  final String uid;

  @override
  AdminDetailsScreenState createState() => AdminDetailsScreenState();
}

class AdminDetailsScreenState extends ConsumerState<AdminDetailsScreen>
    with SingleTickerProviderStateMixin {
  late final StateNotifierProvider<AdminDetailsViewModel, AdminDetailsViewState>
      adminDetailsViewModel;
  late AdminDetailsViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    adminDetailsViewModel =
        StateNotifierProvider<AdminDetailsViewModel, AdminDetailsViewState>(
      (ref) => AdminDetailsViewModel(
        widget.uid,
        ref.read(adminProvider.notifier),
        ref.read(adminFoodConsumptionProvider),
        this,
      ),
    );
    _viewModel = ref.read(adminDetailsViewModel.notifier);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _viewModel = ref.read(adminDetailsViewModel.notifier);
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('User'),
        ),
        body: Consumer(
          builder: (context, ref, _) {
            AdminDetailsViewState state = ref.watch(adminDetailsViewModel);

            ref.listen<AdminDetailsViewState>(
              adminDetailsViewModel,
              (_, state) => state.maybeWhen(
                showAlert: (message) =>
                    ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                  ),
                ),
                openBottomSheet: (entry, uid, onPop) => showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                  ),
                  context: context,
                  builder: (context) => UpdateFoodEntryBottomSheet(
                    foodEntry: entry,
                    uid: uid,
                    onPop: onPop,
                  ),
                ),
                orElse: () => null,
              ),
            );

            return state.maybeWhen(
              init: () => Container(),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (errorMessage) => Center(child: Text(errorMessage)),
              ready: (controller, user, stats) => Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'User ID: ${widget.uid}',
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                'Calorie Limit: ${user.calorieLimit}',
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Admin: ${user.isAdmin}',
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (!user.isAdmin && user.foodEntries != null)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Divider(
                            height: 20.0,
                            color: Colors.grey,
                          ),
                          TabBar(
                            controller: controller,
                            labelColor: Colors.blue,
                            unselectedLabelColor: Colors.grey,
                            labelStyle: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                            unselectedLabelStyle: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                            labelPadding: const EdgeInsets.all(8.0),
                            tabs: const [
                              Text(
                                'Food entries',
                              ),
                              Text(
                                'Stats',
                              ),
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: controller,
                              children: [
                                FoodEntriesTab(
                                  user: user,
                                  viewModel: _viewModel,
                                ),
                                StatsTab(
                                  stats: stats,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              orElse: () => Container(),
            );
          },
        ),
      ),
    );
  }
}
