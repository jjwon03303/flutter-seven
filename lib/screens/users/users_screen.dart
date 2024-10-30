import 'package:daelim_project/common/scaffold/app_scaffold.dart';
import 'package:daelim_project/routes/app_screen.dart';
import 'package:flutter/material.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      appScreen: AppScreen.users,
      child: Center(
        child: Text(
          '메인',
          style: TextStyle(
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}
