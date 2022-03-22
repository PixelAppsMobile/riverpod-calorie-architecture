import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:totaltest/presentation/shared_widgets/buttons.dart';

final _calorieEntryForm = GlobalKey<FormBuilderState>();

class CalorieEntryForm extends StatefulWidget {
  final Function(double newCalorieLimit) onSubmit;
  const CalorieEntryForm(this.onSubmit, {Key? key}) : super(key: key);

  @override
  State<CalorieEntryForm> createState() => _CalorieEntryFormState();
}

class _CalorieEntryFormState extends State<CalorieEntryForm> {
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _calorieEntryForm,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FormBuilderTextField(
            name: 'calories',
            decoration: const InputDecoration(
                labelText: 'New Calorie Limit', hintText: "2300"),
            validator: (String? value) {
              if (value == null) return "Calories can't be left blank";
              if (double.tryParse(value) == null) {
                return "Please enter numerical values only";
              }
              return null;
            },
            keyboardType: TextInputType.number,
            onChanged: (_) => setState(() {}),
          ),
          Buttons.expandedFlatButton(
              _calorieEntryForm.currentState?.validate() ?? false
                  ? () {
                      _calorieEntryForm.currentState!.save();
                      final submissionValues =
                          _calorieEntryForm.currentState!.value;
                      widget.onSubmit.call(
                        double.parse(submissionValues['calories']!),
                      );
                      Navigator.pop(context);
                    }
                  : null,
              "Submit"),
          SizedBox(
            height: MediaQuery.of(context).viewInsets.bottom,
          )
        ],
      ),
    );
  }
}
