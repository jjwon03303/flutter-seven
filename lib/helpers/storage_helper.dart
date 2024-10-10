import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {
  static SharedPreferences? _pref;

  /// SharedPreference 초기화!!
  static Future<void> initialized() async {
    _pref = await SharedPreferences.getInstance();
  }

  /// authData 저장!!!

  /// AuthData 불러오기!!!!
}
