import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/domain/models/food_entry_model.dart';
import 'package:totaltest/presentation/screens/admin_details/widgets/update_food_entry_bottom_sheet/update_food_entry_bottom_sheet_view_model.dart';

class UpdateFoodEntryBottomSheet extends ConsumerStatefulWidget {
  const UpdateFoodEntryBottomSheet({
    Key? key,
    required this.foodEntry,
    required this.uid,
    required this.onPop,
  }) : super(key: key);

  final FoodEntry foodEntry;
  final String uid;
  final void Function() onPop;

  @override
  _UpdateFoodEntryBottomSheetState createState() =>
      _UpdateFoodEntryBottomSheetState();
}

class _UpdateFoodEntryBottomSheetState
    extends ConsumerState<UpdateFoodEntryBottomSheet>
    with UpdateFoodEntryBottomSheetView {
  late UpdateFoodEntryBottomSheetViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = ref.read(updateFoodEntryBottomSheetViewModel)
      ..attachView(this);
    FoodEntry _foodEntry = widget.foodEntry;
    _viewModel.nameController.text = _foodEntry.name;
    _viewModel.calorificValueController.text =
        _foodEntry.calorificValue.toString();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _viewModel = ref.read(updateFoodEntryBottomSheetViewModel)
      ..attachView(this);
  }

  @override
  void dispose() {
    _viewModel.detachView();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(updateFoodEntryBottomSheetViewModel);

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: AnimatedPadding(
        padding: EdgeInsets.only(
            top: 8.0, bottom: MediaQuery.of(context).viewInsets.bottom + 8.0),
        duration: const Duration(milliseconds: 100),
        curve: Curves.decelerate,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Edit',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20.0),
                Form(
                    key: _viewModel.formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: _viewModel.nameController,
                          focusNode: _viewModel.nameFocusNode,
                          decoration: const InputDecoration(
                            label: Text('Name'),
                          ),
                          validator: (val) {
                            if (val == null) {
                              return "Enter name of food item.";
                            }
                            if (val.isEmpty) {
                              return "Enter name of food item.";
                            }
                            return null;
                          },
                          onFieldSubmitted: (val) {
                            _viewModel.calorificValueFocusNode.requestFocus();
                          },
                        ),
                        const SizedBox(height: 20.0),
                        TextFormField(
                          controller: _viewModel.calorificValueController,
                          focusNode: _viewModel.calorificValueFocusNode,
                          decoration: const InputDecoration(
                            label: Text('Calorific value'),
                          ),
                          validator: (val) {
                            if (val == null) {
                              return "Enter calorific value of food item.";
                            }
                            try {
                              double.parse(val);
                            } catch (e) {
                              return "Enter a valid calorific value.";
                            }
                            return null;
                          },
                          onFieldSubmitted: (val) {
                            _viewModel.submit(
                                widget.foodEntry, widget.uid, widget.onPop);
                          },
                        ),
                        const SizedBox(height: 20.0),
                        ElevatedButton(
                          onPressed: () {
                            _viewModel.submit(
                                widget.foodEntry, widget.uid, widget.onPop);
                          },
                          child: Text('Submit'),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void pop() {
    Navigator.pop(context);
  }

  @override
  void showAlert(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
