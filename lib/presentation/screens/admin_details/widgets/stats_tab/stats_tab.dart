import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:totaltest/domain/entities/calorie_stat.dart';

class StatsTab extends ConsumerWidget {
  const StatsTab({
    Key? key,
    required this.stats,
  }) : super(key: key);

  final CalorieStats stats;

  @override
  Widget build(BuildContext context, ref) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Calorie intake per day (by week)',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 200,
                child: charts.BarChart(
                  [
                    charts.Series<WeeklyCalorieStat, String>(
                      id: 'Calorie Intake',
                      colorFn: (_, __) =>
                          charts.MaterialPalette.blue.shadeDefault,
                      domainFn: (WeeklyCalorieStat stat, _) => stat.weekNo == -1
                          ? 'Today'
                          : (stat.weekNo == 0)
                              ? 'Last 7 days'
                              : 'Week before',
                      measureFn: (WeeklyCalorieStat stat, _) =>
                          stat.avgCalorieIntake,
                      data: stats.weeklyCalorieStats,
                    )
                  ],
                  animate: true,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                'No of food entries added (by week)',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 200,
                child: charts.BarChart(
                  [
                    charts.Series<WeeklyCalorieStat, String>(
                      id: 'No of entries added',
                      colorFn: (_, __) =>
                          charts.MaterialPalette.green.shadeDefault,
                      domainFn: (WeeklyCalorieStat stat, _) => stat.weekNo == -1
                          ? 'Today'
                          : (stat.weekNo == 0)
                              ? 'Last 7 days'
                              : 'Week before',
                      measureFn: (WeeklyCalorieStat stat, _) =>
                          stat.foodEntries.length,
                      data: stats.weeklyCalorieStats,
                    )
                  ],
                  animate: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
