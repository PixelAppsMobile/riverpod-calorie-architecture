import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/domain/models/user_profile_model.dart';

class AdminDetailsScreen extends ConsumerStatefulWidget {
  const AdminDetailsScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UserProfile user;

  @override
  AdminDetailsScreenState createState() => AdminDetailsScreenState();
}

class AdminDetailsScreenState extends ConsumerState<AdminDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('User'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'User ID: ${widget.user.userID}',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Calorie Limit: ${widget.user.calorieLimit}',
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
