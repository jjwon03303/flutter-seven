import 'package:daelim_project/common/scaffold/app_scaffold.dart';
import 'package:daelim_project/models/user_data.dart';
import 'package:daelim_project/routes/app_screen.dart';
import 'package:easy_extension/easy_extension.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final List<UserData> _dummyDataList = List.generate(20, (i) {
    //tood
    final index = i + 1;
    return UserData(
      id: "$index",
      name: name,
      email: email,
      student_number: student_number,
      profileImageUrl: profileImageUrl,
    );
  });
  List<UserData> _searchedDataList = [];

  @override
  void initState() {
    //
    _searchedDataList = _dummyDataList;
  }

  final _defaultInputBorder = const OutlineInputBorder(
    borderSide: BorderSide(
      color: Color(0xFFE4E4E7),
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  );

  void _onSearch(String value) {
    final cachedDataList = List.from(_dummyDataList);

    setState(
      () {
        _searchedDataList = _dummyDataList.where((e) => e.name.toLowerCase()),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appScreen: AppScreen.users,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(),
          ),
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
            decoration: InputDecoration(
              filled: false,
              enabledBorder: _defaultInputBorder,
              focusedBorder: _defaultInputBorder.copyWith(
                  borderSide: const BorderSide(
                color: Colors.black,
              )),
              prefixIcon: const Icon(LucideIcons.search),
              hintText: "유저 검색...",
            ),
          ),
          //여백
          10.heightBox,
          //줄
          const Divider(),

          if (_searchedDataList.isEmpty) Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top:10),
            child: const Text("검색 결과가 없습니다.", style: TextStyle(fontSize: 20)),
          )
          else 
          //유저 리스트뷰
          Expanded(
            // 리스트뷰는 expaned로 감싸야함
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              itemCount: _dummyDataList.length,
              itemBuilder: (context, index) {
                final dummy = _dummyDataList[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: const Color(0xFFEAEAEA),
                    foregroundImage: NetworkImage(
                      dummy.profileImageUrl,
                    ),
                  ),
                  title: Text(
                    dummy.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(dummy.student_number),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
