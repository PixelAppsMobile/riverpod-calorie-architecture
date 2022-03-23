import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/domain/extenstions/datetime_ext.dart';
import 'package:totaltest/domain/models/calorie_stat.dart';
import 'package:totaltest/domain/models/food_entry_model.dart';
import 'package:totaltest/domain/models/user_profile_model.dart';
import 'package:totaltest/presentation/screens/admin_details/admin_details_view_model.dart';
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
    with SingleTickerProviderStateMixin, AdminDetailsView {
  late AdminDetailsViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = ref.read(adminDetailsViewModel)..attachView(this);
    _viewModel.initialise(widget.uid, this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _viewModel = ref.read(adminDetailsViewModel);
  }

  @override
  void dispose() {
    _viewModel.detachView();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('User'),
        ),
        body: Builder(
          builder: (context) {
            if (ref.watch(adminDetailsViewModel).loading) {
              return const Center(child: CircularProgressIndicator());
            }

            UserProfile user = ref.watch(adminDetailsViewModel).currentUser;

            return Column(
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
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Admin: ${user.isAdmin}',
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
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
                          controller: _viewModel.tabController,
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
                            controller: _viewModel.tabController,
                            children: [
                              FoodEntriesTab(user: user, viewModel: _viewModel),
                              const StatsTab(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  Future<void> showAlert(String message) async {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Future<void> openBottomSheet(
      FoodEntry entry, String uid, void Function() onPop) async {
    showModalBottomSheet(
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
    );
  }
}

class StatsTab extends ConsumerWidget {
  const StatsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Calorie intake per day (by week)',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 200,
                child: charts.BarChart(
                  [
                    charts.Series<WeeklyCalorieStat, String>(
                      id: 'Calorie Intake',
                      colorFn: (_, __) =>
                          charts.MaterialPalette.blue.shadeDefault,
                      domainFn: (WeeklyCalorieStat stat, _) =>
                          'Week ' +
                          (ref
                                      .watch(adminDetailsViewModel)
                                      .stats
                                      .weeklyCalorieStats
                                      .length -
                                  stat.weekNo)
                              .toString(),
                      measureFn: (WeeklyCalorieStat stat, _) =>
                          stat.avgCalorieIntake,
                      data: ref
                          .watch(adminDetailsViewModel)
                          .stats
                          .weeklyCalorieStats,
                    )
                  ],
                  animate: true,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                'No of food entries added (by week)',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 200,
                child: charts.BarChart(
                  [
                    charts.Series<WeeklyCalorieStat, String>(
                      id: 'No of entries added',
                      colorFn: (_, __) =>
                          charts.MaterialPalette.green.shadeDefault,
                      domainFn: (WeeklyCalorieStat stat, _) =>
                          'Week ' +
                          (ref
                                      .watch(adminDetailsViewModel)
                                      .stats
                                      .weeklyCalorieStats
                                      .length -
                                  stat.weekNo)
                              .toString(),
                      measureFn: (WeeklyCalorieStat stat, _) =>
                          stat.foodEntries.length,
                      data: ref
                          .watch(adminDetailsViewModel)
                          .stats
                          .weeklyCalorieStats,
                    )
                  ],
                  animate: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FoodEntriesTab extends StatelessWidget {
  const FoodEntriesTab({
    Key? key,
    required this.user,
    required AdminDetailsViewModel viewModel,
  })  : _viewModel = viewModel,
        super(key: key);

  final UserProfile user;
  final AdminDetailsViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: user.foodEntries!.length,
        itemBuilder: (context, index) => ListTile(
          title: SizedBox(
            width: MediaQuery.of(context).size.width * 0.75,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  user.foodEntries![index].name,
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  user.foodEntries![index].calorificValue.toString(),
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
          subtitle: Text(
            user.foodEntries![index].time.toReadableString(),
            style: const TextStyle(fontSize: 12.0),
          ),
          trailing: SizedBox(
            width: MediaQuery.of(context).size.width * 0.25,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    _viewModel.editFoodEntry(user.foodEntries![index]);
                  },
                  icon: const Icon(
                    Icons.edit,
                    size: 16.0,
                    color: Colors.grey,
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    _viewModel.deleteFoodEntry(user.foodEntries![index]);
                  },
                  icon: const Icon(
                    Icons.delete_forever_rounded,
                    size: 16.0,
                    color: Colors.redAccent,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
