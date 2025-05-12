import 'package:flutter_rest_api/model/user.dart';

class UserRegistered {
  final DateTime date;
  final int age;

  UserRegistered({
    required this.date,
    required this.age,
  });

  factory UserRegistered.fromMap(Map<String, dynamic> json) {
    return UserRegistered(
      date: DateTime.parse(json['date']),
      age: json['age'],
    );
  }
}
