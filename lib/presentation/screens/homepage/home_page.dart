import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/domain/providers/food_consumption/user_food_consumption_provider.dart';
import 'package:totaltest/domain/providers/app_user/app_user_provider.dart';
import 'package:totaltest/presentation/screens/homepage/home_page_view_model.dart';
import 'package:totaltest/presentation/screens/homepage/state/home_page_view_state.dart';
import 'package:totaltest/presentation/screens/homepage/widgets/calories_entry_form.dart';
import 'package:totaltest/presentation/screens/homepage/widgets/calories_limit_exceeded_warning.dart';
import 'package:totaltest/presentation/screens/homepage/widgets/food_entries_list.dart';
import 'package:totaltest/presentation/screens/homepage/widgets/food_entry_form.dart';
import 'package:totaltest/presentation/shared_widgets/loading_indicator.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late final StateNotifierProvider<HomePageViewModel, HomePageViewState>
      homePageViewModel;
  late final HomePageViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    homePageViewModel =
        StateNotifierProvider<HomePageViewModel, HomePageViewState>(
      (ref) => HomePageViewModel(
        ref.read(appUserProvider.notifier),
        ref.read(userFoodConsumptionProvider.notifier),
      ),
    );
    _viewModel = ref.read(homePageViewModel.notifier);
  }

  @override
  Widget build(BuildContext context) {
    HomePageViewState state = ref.watch(homePageViewModel);

    _stateListeners();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Intake Overview"),
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
      floatingActionButton: state.maybeWhen(
        ready: (_) => FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => _viewModel.openAddFoodEntrySheet(),
        ),
        orElse: () => null,
      ),
      body: Column(
        children: [
          Builder(
            builder: (context) => state.maybeWhen(
              loading: () => const Center(
                child: LoadingIndicators.basicLoadingIndicator,
              ),
              ready: (foodEntries) => FoodEntriesList(
                foodEntries: foodEntries,
              ),
              showCaloriesLimitExceededWarning: () =>
                  CaloriesLimiExceededWarning(
                viewModel: _viewModel,
              ),
              error: (message) => Center(
                child: Text(message),
              ),
              orElse: () => Container(),
            ),
          ),
        ],
      ),
    );
  }

  _stateListeners() {
    ref.listen<HomePageViewState>(
      homePageViewModel,
      (_, state) => state.maybeWhen(
        showSnackBar: (message, backgroundColor) =>
            ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: backgroundColor,
          ),
        ),
        showAddFoodEntrySheet: () => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          enableDrag: true,
          builder: (context) {
            return FoodEntryForm(_viewModel.addNewEntry);
          },
        ),
        showCalorieLimitUpdateSheet: () => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          enableDrag: true,
          builder: (context) {
            return CalorieEntryForm(_viewModel.updateCalorieLimit);
          },
        ),
        orElse: () => null,
      ),
    );
  }
}
