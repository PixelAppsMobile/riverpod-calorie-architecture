import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:totaltest/presentation/res/colors.dart';
import 'package:totaltest/presentation/screens/homepage/homepage_view_model.dart';
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
  late final HomePageViewModel _viewModel;
  @override
  void initState() {
    _viewModel = ref.read(homePageViewModel);
    _viewModel.attachView(this);
    _viewModel.initialize();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(homePageViewModel);
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          child: const Text("Your Intake Overview"),
          onTap: _viewModel.logOut,
        ),
      ),
      body: Column(children: [
        if (_viewModel.showCalorieWarning)
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            color: AppColor.errorRed,
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  "You are ${_viewModel.extraCalories} calories over your daily limit",
                  style: const TextStyle(color: Colors.white),
                )),
                Buttons.whiteElevatedButton(
                    () => _openCalorieUpdateSheet(context), "Change", context)
              ],
            ),
          ),
        Expanded(
            child: _viewModel.loading
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
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      );
                    }))
      ]),

      floatingActionButton: Builder(builder: (context) {
        return FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => _openFoodEntrySheet(context),
        );
      }),
      // resizeToAvoidBottomInset: true,
    );
  }

  void _openFoodEntrySheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        enableDrag: true,
        builder: (context) {
          return FoodEntryForm(_viewModel.addNewEntry);
        });
  }

  void _openCalorieUpdateSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        enableDrag: true,
        builder: (context) {
          return CalorieEntryForm(_viewModel.updateCalorieLimit);
        });
  }

  void showDateRange() {}

  @override
  void showSnackbar(String message, {Color? color}) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message), backgroundColor: color));
  }
}
