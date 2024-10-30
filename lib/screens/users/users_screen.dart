import 'package:daelim_project/common/scaffold/app_scaffold.dart';
import 'package:daelim_project/routes/app_screen.dart';
import 'package:easy_extension/easy_extension.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  void _onSearch(String value) {
    //todo
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appScreen: AppScreen.users,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 유저 목록 타이틀
          const Text(
            "유저 목록",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
          //여백
          15.heightBox, // from easy-extension
          //검색 바
          TextField(
            onChanged: _onSearch,
            decoration: const InputDecoration(
              filled: false,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFE4E4E7),
                ),
              ),
              prefixIcon: Icon(LucideIcons.search),
              hintText: "유저 검색...",
            ),
          ),
          //여백
          10.heightBox,
          //줄
          const Divider(),
          //유저 리스트뷰
        ],
      ),
    );
  }
}
