import 'package:flutter/material.dart';
import 'package:totaltest/presentation/res/colors/colors_res.dart';
import 'package:totaltest/presentation/screens/homepage/home_page_view_model.dart';
import 'package:totaltest/presentation/shared_widgets/buttons.dart';

class CaloriesLimiExceededWarning extends StatelessWidget {
  const CaloriesLimiExceededWarning({
    Key? key,
    required HomePageViewModel viewModel,
  })  : _viewModel = viewModel,
        super(key: key);

  final HomePageViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      color: ColorsRes.errorRed,
      child: Row(
        children: [
          Expanded(
            child: Text(
              "You are ${_viewModel.extraCalories} calories over your daily limit",
              style: const TextStyle(color: ColorsRes.white),
            ),
          ),
          Buttons.whiteElevatedButton(
            () => _viewModel.openUpdateCalorieLimitSheet(),
            "Change",
            context,
          )
        ],
      ),
    );
  }
}
