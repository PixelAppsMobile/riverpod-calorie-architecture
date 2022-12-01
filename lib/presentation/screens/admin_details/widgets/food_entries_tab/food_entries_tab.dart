import 'package:flutter/material.dart';
import 'package:totaltest/domain/entities/user_profile.dart';
import 'package:totaltest/domain/extenstions/datetime_ext.dart';
import 'package:totaltest/presentation/res/colors/colors_res.dart';
import 'package:totaltest/presentation/screens/admin_details/admin_details_view_model.dart';

class FoodEntriesTab extends StatelessWidget {
  const FoodEntriesTab({
    Key? key,
    required this.user,
    required AdminDetailsViewModel viewModel,
  })  : _viewModel = viewModel,
        super(key: key);

  final UserProfile user;
  final AdminDetailsViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: user.foodEntries!.length,
      itemBuilder: (context, index) => ListTile(
        title: SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                user.foodEntries![index].name,
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                user.foodEntries![index].calorificValue.toString(),
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
        subtitle: Text(
          user.foodEntries![index].time.toReadableString(),
          style: const TextStyle(fontSize: 12.0),
        ),
        trailing: SizedBox(
          width: MediaQuery.of(context).size.width * 0.25,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  _viewModel.editFoodEntry(user.foodEntries![index]);
                },
                icon: const Icon(
                  Icons.edit,
                  size: 16.0,
                  color: ColorsRes.grey,
                ),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  _viewModel.deleteFoodEntry(user.foodEntries![index]);
                },
                icon: const Icon(
                  Icons.delete_forever_rounded,
                  size: 16.0,
                  color: ColorsRes.redAccent,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
