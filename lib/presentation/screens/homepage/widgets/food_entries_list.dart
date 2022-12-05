import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:totaltest/domain/entities/food_entry.dart';

class FoodEntriesList extends StatelessWidget {
  const FoodEntriesList({
    Key? key,
    required this.foodEntries,
  }) : super(key: key);

  final List<FoodEntry> foodEntries;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: foodEntries.length,
        itemBuilder: (context, index) {
          final foodEntry = foodEntries[index];
          return ListTile(
            title: Text(foodEntry.name),
            subtitle: Text(DateFormat.yMMMMEEEEd().format(foodEntry.time)),
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
    );
  }
}
