import 'package:totaltest/domain/models/food_entry_model.dart';

class CalorieStats {
  final List<WeeklyCalorieStat> weeklyCalorieStats;

  CalorieStats(this.weeklyCalorieStats);

  factory CalorieStats.fromFoodEntries(List<FoodEntry> foodEntries) {
    final List<WeeklyCalorieStat> weeklyCalorieStats = [];

    final DateTime _currentTime = DateTime.now();
    final DateTime _todayDateTime =
        DateTime(_currentTime.year, _currentTime.month, _currentTime.day);
    final DateTime _tomorrowDateTime =
        _todayDateTime.add(const Duration(days: 1));

    int i = 0; // Track foodEntries index
    int j = 0; // Track weekNo
    while (i < foodEntries.length && j < 4) {
      final DateTime _weekBeforeTomorrowDateTime =
          _tomorrowDateTime.subtract(Duration(days: (j + 1) * 7));

      double sumCalorieIntake = 0.0;
      List<FoodEntry> weeklyFoodEntries = [];
      while (i < foodEntries.length &&
          foodEntries[i].time.isAfter(_weekBeforeTomorrowDateTime)) {
        weeklyFoodEntries.add(foodEntries[i]);
        sumCalorieIntake += foodEntries[i].calorificValue;
        i++;
      }
      double avgCalorieIntakePerDayForWeek = sumCalorieIntake / 7;
      WeeklyCalorieStat stat = WeeklyCalorieStat(
        j,
        weeklyFoodEntries,
        avgCalorieIntakePerDayForWeek,
      );
      weeklyCalorieStats.add(stat);
      j++;
    }

    return CalorieStats(weeklyCalorieStats);
  }
}

class WeeklyCalorieStat {
  final int weekNo;
  final List<FoodEntry> foodEntries;
  final double avgCalorieIntake;

  WeeklyCalorieStat(this.weekNo, this.foodEntries, this.avgCalorieIntake);
}
