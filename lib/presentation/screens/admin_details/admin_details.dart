import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/domain/extenstions/datetime_ext.dart';
import 'package:totaltest/domain/models/user_profile_model.dart';
import 'package:totaltest/presentation/screens/admin_details/admin_details_view_model.dart';

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
                              Expanded(
                                child: ListView.builder(
                                  itemCount: user.foodEntries!.length,
                                  itemBuilder: (context, index) => ListTile(
                                    title: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.75,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            user.foodEntries![index].name,
                                            style: const TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Text(
                                            user.foodEntries![index]
                                                .calorificValue
                                                .toString(),
                                            style: const TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    subtitle: Text(
                                      user.foodEntries![index].time
                                          .toReadableString(),
                                      style: const TextStyle(fontSize: 12.0),
                                    ),
                                    trailing: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.25,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          IconButton(
                                            padding: EdgeInsets.zero,
                                            onPressed: () {
                                              //TODO: Edit food entry
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
                                              // TODO: Delete food entry
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
                              ),
                              Expanded(
                                child: Container(
                                  color: Colors.blue,
                                ),
                              ),
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
}
