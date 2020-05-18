import 'dart:convert';

import 'package:firebase/models/user.dart';
import 'package:flutter/material.dart';
import 'package:firebase/data/dummy_users.dart';
import 'package:http/http.dart' as http;

class Users with ChangeNotifier {
  static const String _baseUrl =
      'https://cod3r-flutter-firebase-class.firebaseio.com/';

  Map<String, User> _items = {...DUMMY_USERS};

  Future<void> refresh() async {
    print('começou');
    final response = await http.get( "$_baseUrl/users.json");
    
    var list = json.decode( response.body );
    print(list);
    var received = list.map<String, User>((model) { 
      print('model');
      print(model);
      User u = User.fromJson(model);
      return u;
    });
    //_items = received.cast<String, User>();

    // var outro = received.map((key, value) {
    //   return {key: value};
    // });
    
    //_items

    print('outro valor');
    // print(received);
    this.notifyListeners();
  }

  


  List<User> get all {
    
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  Future<void> put(User user) async {
    if (user == null) {
      return;
    }

    if (user.id != null &&
        user.id.trim().isNotEmpty &&
        _items.containsKey(user.id)) {
      
      await http.patch(
        "$_baseUrl/users/${user.id}.json",
        body: json.encode({
          'name': user.name,
          'email': user.email,
          'avatarUrl': user.avatarUrl,
        }),
      );

      _items.update(
        user.id,
        (value) => user,
      );
    } else {
      final response = await http.post(
        "$_baseUrl/users.json",
        body: json.encode({
          'name': user.name,
          'email': user.email,
          'avatarUrl': user.avatarUrl,
        }),
      );

      final id = json.decode(response.body)['name'];
      print(json.decode(response.body));

      _items.putIfAbsent(
        id,
        () => User(
          id: id,
          name: user.name,
          email: user.email,
          avatarUrl: user.avatarUrl,
        ),
      );
    }

    this.notifyListeners();
  }

  void remove(User user) {
    if (user != null && user.id != null) {
      _items.remove(user.id);
      this.notifyListeners();
    }
  }
}
