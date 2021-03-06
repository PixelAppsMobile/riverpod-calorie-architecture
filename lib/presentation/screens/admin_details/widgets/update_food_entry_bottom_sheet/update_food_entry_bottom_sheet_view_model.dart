import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/core/base_view_model.dart';
import 'package:totaltest/domain/models/food_entry_model.dart';
import 'package:totaltest/domain/providers/admin_provider.dart';

final updateFoodEntryBottomSheetViewModel = ChangeNotifierProvider((ref) =>
    UpdateFoodEntryBottomSheetViewModel(ref.read(adminProvider.notifier)));

mixin UpdateFoodEntryBottomSheetView {
  void showAlert(String message);
  void pop();
}

class UpdateFoodEntryBottomSheetViewModel extends BaseViewModel {
  final AdminProvider _adminProvider;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController calorificValueController =
      TextEditingController();

  final FocusNode nameFocusNode = FocusNode();
  final FocusNode calorificValueFocusNode = FocusNode();

  UpdateFoodEntryBottomSheetViewModel(this._adminProvider) {
    FocusManager.instance.addListener(_focusListener);
  }

  void _focusListener() {
    notifyListeners();
  }

  Future<void> submit(
      FoodEntry entry, String uid, void Function() onPop) async {
    if (formKey.currentState!.validate()) {
      final either = await _adminProvider.updateFoodEntry(
          entry.copyWith(
            calorificValue: double.parse(calorificValueController.text),
            name: nameController.text,
          ),
          uid);
      return either.fold(
        (l) => view!.showAlert(l.title),
        (r) {
          view!.pop();
          onPop();
        },
      );
    }
  }

  @override
  void dispose() {
    FocusManager.instance.removeListener(_focusListener);

    nameFocusNode.dispose();
    calorificValueFocusNode.dispose();

    nameController.dispose();
    calorificValueController.dispose();
    super.dispose();
  }
}
