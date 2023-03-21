import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../models/user_model.dart';

class UserProvider with ChangeNotifier {
  final String authToken;
  final String creatorUserId;
  List<UsersModel> _users = [];

  UserProvider(this.authToken, this.creatorUserId, this._users);

  List<UsersModel> get users {
    return [..._users];
  }

  UsersModel findById(String id) {

    return _users.firstWhere((user) => user.id == id);
  }
  Future<void> addUsers(String username, String fullName, String password) async {
    final url = Uri.parse(
        'https://attendance-app-39a90-default-rtdb.asia-southeast1.firebasedatabase.app/users.json?auth=$authToken');
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'username': username,
          'fullName': fullName,
          'password': password,
          'creatorId': creatorUserId
        }),
      );
      if(response.statusCode != 200) {
        print('Failed to add user: ${response.statusCode}');
        return;
      }
      print('User added successfully');
      final newUsers = UsersModel(
          username: username,
          fullName: fullName,
          password: password,
          // imageUrl: product.imageUrl,
          id: json.decode(response.body)['name']);
      _users.add(newUsers);
      // _items.insert(0, newProduct); // at the start of the list
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }
}
