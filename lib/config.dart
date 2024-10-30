// NOTE: API 호출 URL
// ignore_for_file: unnecessary_brace_in_string_interps

const String baseUrl = 'https://daelim-server.fleecy.dev/functions/v1';
const String getTokenUrl = '$baseUrl/auth/get-token';
const String getUserDataUrl = '$baseUrl/auth/my-data';
const String setProfileImageUrl = '$baseUrl/auth/set-profile-image';

const String _storagePublicUrl =
    "https://daelim-server.fleecy.dev/storage/v1/object/public";

// NOTE: 아이콘 URL
const String icGoogle = '${_storagePublicUrl}/icons/google.png';
const String icApple = '${_storagePublicUrl}/icons/apple.png';
const String icGithub = '${_storagePublicUrl}/icons/github.png';

// 이미지 URL
const String defaultProfileImageUrl = '${_storagePublicUrl}/icons/user.png';
