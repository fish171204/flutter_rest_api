import 'dart:ui';

import 'package:flutter_rest_api/model/user_dob.dart';
import 'package:flutter_rest_api/model/user_id.dart';
import 'package:flutter_rest_api/model/user_location.dart';
import 'package:flutter_rest_api/model/user_login.dart';
import 'package:flutter_rest_api/model/user_name.dart';
import 'package:flutter_rest_api/model/user_picture.dart';
import 'package:flutter_rest_api/model/user_registered.dart';

class User {
  final String gender;
  final UserName name;
  final UserLocation location;
  final String email;
  final UserLogin login;
  final UserDob dob;
  final UserRegistered registered;
  final String phone;
  final String cell;
  final UserId id;
  final UserPicture picture;
  final String nat;

  User({
    required this.gender,
    required this.name,
    required this.location,
    required this.email,
    required this.login,
    required this.dob,
    required this.registered,
    required this.phone,
    required this.cell,
    required this.id,
    required this.picture,
    required this.nat,
  });

  String get fullName {
    return '${name.title} ${name.first} ${name.last}';
  }

  factory User.fromMap(Map<String, dynamic> json) {
    final name = UserName.fromMap(json['name']);
    final dob = UserDob.fromMap(json['dob']);
    final location = UserLocation.fromMap(json['location']);
    final picture = UserPicture.fromMap(json['picture']);
    final login = UserLogin.fromMap(json['login']);
    final registered = UserRegistered.fromMap(json['registered']);
    final id = UserId.fromMap(json['id']);
    return User(
      gender: json['gender'],
      name: name,
      location: location,
      email: json['email'],
      login: login,
      dob: dob,
      registered: registered,
      phone: json['phone'],
      cell: json['cell'],
      id: id,
      picture: picture,
      nat: json['nat'],
    );
  }
}
