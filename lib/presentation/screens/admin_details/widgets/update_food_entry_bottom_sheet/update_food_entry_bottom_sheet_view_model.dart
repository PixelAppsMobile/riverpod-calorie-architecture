import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/domain/entities/food_entry.dart';
import 'package:totaltest/domain/providers/food_consumption/admin_food_consumption_provider.dart';
import 'package:totaltest/presentation/screens/admin_details/widgets/update_food_entry_bottom_sheet/state/update_food_entry_bottom_sheet_view_state.dart';

class UpdateFoodEntryBottomSheetViewModel
    extends StateNotifier<UpdateFoodEntryBottomSheetViewState> {
  final AdminFoodConsumptionProvider _adminFoodConsumptionProvider;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _calorificValueController =
      TextEditingController();

  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _calorificValueFocusNode = FocusNode();

  late UpdateFoodEntryBottomSheetViewState cachedState;

  UpdateFoodEntryBottomSheetViewModel(
    FoodEntry entry,
    this._adminFoodConsumptionProvider,
  ) : super(const UpdateFoodEntryBottomSheetViewState.init()) {
    FocusManager.instance.addListener(_emitReady);
    _nameController.text = entry.name;
    _calorificValueController.text = entry.calorificValue.toString();

    _emitReady();
  }

  void _emitReady() {
    state = UpdateFoodEntryBottomSheetViewState.ready(
      calorificValueController: _calorificValueController,
      calorificValueNode: _calorificValueFocusNode,
      foodNameController: _nameController,
      foodNameNode: _nameFocusNode,
    );
  }

  Future<void> submit(
      FoodEntry entry, String uid, void Function() onPop) async {
    if (formKey.currentState!.validate()) {
      final either = await _adminFoodConsumptionProvider.updateFoodEntry(
        entry.copyWith(
          calorificValue: double.parse(_calorificValueController.text),
          name: _nameController.text,
        ),
        uid,
      );
      return either.fold(
        (l) {
          cachedState = state;
          state = UpdateFoodEntryBottomSheetViewState.showAlert(l.title);
          state = cachedState;
        },
        (r) {
          state = const UpdateFoodEntryBottomSheetViewState.pop();
          onPop();
        },
      );
    }
  }

  @override
  void dispose() {
    FocusManager.instance.removeListener(_emitReady);

    _nameFocusNode.dispose();
    _calorificValueFocusNode.dispose();

    _nameController.dispose();
    _calorificValueController.dispose();
    super.dispose();
  }
}
