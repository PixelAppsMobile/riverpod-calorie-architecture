import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:totaltest/domain/repositories/food_consumption/food_consumption_repo.dart';
import 'package:totaltest/presentation/providers/user_provider.dart';
import 'package:totaltest/presentation/res/colors.dart';
import 'package:totaltest/presentation/screens/homepage/home_page_view_model.dart';
import 'package:totaltest/presentation/screens/homepage/state/home_page_view_state.dart';
import 'package:totaltest/presentation/screens/homepage/widgets/calories_entry_form.dart';
import 'package:totaltest/presentation/screens/homepage/widgets/food_entry_form.dart';
import 'package:totaltest/presentation/shared_widgets/buttons.dart';
import 'package:totaltest/presentation/shared_widgets/loading_indicator.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> implements HomePageView {
  late final homePageViewModel;
  late final HomePageViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    homePageViewModel =
        StateNotifierProvider<HomePageViewModel, HomePageViewState>(
      (ref) => HomePageViewModel(
        ref.read(foodConsumptionRepo),
        ref.read(userProvider.notifier),
      ),
    );
    _viewModel = ref.read(homePageViewModel.notifier);
  }

  @override
  Widget build(BuildContext context) {
    HomePageViewState state = ref.watch(homePageViewModel);

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
              orElse: () => null,
            ));

    return state.maybeMap(
      init: (value) => Container(),
      ready: (state) => Scaffold(
        appBar: AppBar(
          title: InkWell(
            child: const Text("Your Intake Overview"),
            onTap: _viewModel.logOut,
          ),
        ),
        body: Column(
          children: [
            if (state.showCalorieWarning)
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                color: AppColor.errorRed,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "You are ${_viewModel.extraCalories} calories over your daily limit",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    Buttons.whiteElevatedButton(
                      () => _openCalorieUpdateSheet(context),
                      "Change",
                      context,
                    )
                  ],
                ),
              ),
            Expanded(
              child: state.loading
                  ? const Center(child: LoadingIndicators.basicLoadingIndicator)
                  : ListView.builder(
                      itemCount: _viewModel.foodEntries.length,
                      itemBuilder: (context, index) {
                        final foodEntry = _viewModel.foodEntries[index];
                        return ListTile(
                          title: Text(foodEntry.name),
                          subtitle: Text(
                              DateFormat.yMMMMEEEEd().format(foodEntry.time)),
                          leading: Text(
                            "${foodEntry.calorificValue} C",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),

        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => _openFoodEntrySheet(context),
        ),
        // resizeToAvoidBottomInset: true,
      ),
      loading: (value) => const Scaffold(
        body: LoadingIndicators.basicLoadingIndicator,
      ),
      error: (state) => Scaffold(
        body: Center(
          child: Text(state.message),
        ),
      ),
      orElse: () => Container(),
    );
  }

  void _openFoodEntrySheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      builder: (context) {
        return FoodEntryForm(_viewModel.addNewEntry);
      },
    );
  }

  void _openCalorieUpdateSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      builder: (context) {
        return CalorieEntryForm(_viewModel.updateCalorieLimit);
      },
    );
  }

  void showDateRange() {}

  @override
  void showSnackbar(String message, {Color? color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }
}
