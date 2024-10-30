import 'dart:convert';

import 'package:flutter/widgets.dart';

class UserData {
  final String id;
  final String name;
  final String email;
  final String student_number;
  final String profileImageUrl;
  final DateTime? lastSignInAt;
  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.student_number,
    required this.profileImageUrl,
    this.lastSignInAt,
  });

  UserData copyWith({
    String? id,
    String? name,
    String? email,
    String? student_number,
    String? profileImageUrl,
    ValueGetter<DateTime?>? lastSignInAt,
  }) {
    return UserData(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      student_number: student_number ?? this.student_number,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      lastSignInAt: lastSignInAt != null ? lastSignInAt() : this.lastSignInAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'student_number': student_number,
      'profileImageUrl': profileImageUrl,
      'lastSignInAt': lastSignInAt?.millisecondsSinceEpoch,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      student_number: map['student_number'] ?? '',
      profileImageUrl: map['profileImageUrl'] ?? '',
      lastSignInAt: map['lastSignInAt'] != null //
          ? DateTime.fromMillisecondsSinceEpoch(map['lastSignInAt'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) =>
      UserData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserData(id: $id, name: $name, email: $email, student_number: $student_number, profileImageUrl: $profileImageUrl, lastSignInAt: $lastSignInAt)';
  }
}
