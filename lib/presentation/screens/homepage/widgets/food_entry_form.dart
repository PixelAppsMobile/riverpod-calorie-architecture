import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:totaltest/presentation/shared_widgets/buttons.dart';

final _foodFormKey = GlobalKey<FormBuilderState>();

class FoodEntryForm extends StatefulWidget {
  final Function(String name, double calorificValue, DateTime consumptionTime)
      onSubmit;
  const FoodEntryForm(this.onSubmit, {Key? key}) : super(key: key);

  @override
  State<FoodEntryForm> createState() => _FoodEntryFormState();
}

class _FoodEntryFormState extends State<FoodEntryForm> {
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _foodFormKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FormBuilderTextField(
            name: 'name',
            decoration: const InputDecoration(
                labelText: 'What did you eat?',
                hintText: "Banana, Cereal, Curd....."),
            validator: (String? value) {
              if (value == null) return "Name can't be left blank";

              return null;
            },
            onChanged: (_) => setState(() {}),
            keyboardType: TextInputType.text,
          ),
          FormBuilderTextField(
            name: 'calories',
            decoration: const InputDecoration(
                labelText: 'Calory intake?', hintText: "230"),
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
          FormBuilderDateTimePicker(
            name: 'date',
            inputType: InputType.both,
            decoration: const InputDecoration(
              labelText: 'Consumption Time',
            ),
            initialValue: DateTime.now(),
            initialDate: DateTime.now(),
            initialTime: TimeOfDay.fromDateTime(DateTime.now()),
            onChanged: (_) => setState(() {}),
            validator: (DateTime? time) {
              if (time == null) return "Please choose a time";
              if (time.isAfter(DateTime.now())) return "Please select a time";
              return null;
            },
          ),
          Buttons.expandedFlatButton(
              _foodFormKey.currentState?.validate() ?? false
                  ? () {
                      _foodFormKey.currentState!.save();
                      final submissionValues = _foodFormKey.currentState!.value;
                      widget.onSubmit.call(
                          submissionValues['name']!,
                          double.parse(submissionValues['calories']!),
                          submissionValues['date']!);
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
