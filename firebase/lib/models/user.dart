import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String avatarUrl;

  const User(
      {this.id,
      @required this.name,
      @required this.email,
      @required this.avatarUrl});

  factory User.fromJson(Map<String, dynamic> json) {
        return User(
          name: json['name'],
          email: json['email'],
          avatarUrl: json['avatarUrl']);
  }
}
