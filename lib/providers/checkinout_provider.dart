import 'dart:convert';

import 'package:aplikasi_phincon/models/check-in-out_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../helpers/http_exception.dart';

class CheckInOutProvider with ChangeNotifier {
  final String authToken;
  final String creatorUserId;
  List<CheckInOutModel> _checkInOut = [];

  CheckInOutProvider(this.authToken, this.creatorUserId, this._checkInOut);

  List<CheckInOutModel> get checkInOuts {
    return [..._checkInOut];
  }

  List<String> get checkInOutIds {
    print(checkInOuts.map((checkInOut) => checkInOut.id!).toList());
    return checkInOuts.map((checkInOut) => checkInOut.id!).toList();
  }


  Future<void> usersCheck(CheckInOutModel checkInOutModel) async {
    // print(authToken);
    final url = Uri.parse(
        'https://attendance-app-39a90-default-rtdb.asia-southeast1.firebasedatabase.app/checkInOut.json?auth=$authToken');
    try {
      final timeStamp = DateTime.now();
      final response = await http.post(
        url,
        body: json.encode({
          'userId': checkInOutModel.userId,
          'check-inTime': DateFormat('dd-MM-yyyy hh:mm a').format(timeStamp),
          'check-outTime': "--/--",
          // 'creatorId': creatorUserId,
        }),
      );
      if (response.statusCode != 200) {
        print('Failed to add checkIn: ${response.statusCode}');
        return;
      }
      print('CheckIn added successfully');
      final newCheckInOut = CheckInOutModel(
          userId: checkInOutModel.userId,
          checkInTime: checkInOutModel.checkInTime,
          checkOutTime: checkInOutModel.checkOutTime,
          // location: checkInOutModel.location,
          id: json.decode(response.body)['name']);
      _checkInOut.add(newCheckInOut);
      print(
          "id yang seharusnya : newCheckinOut..${newCheckInOut.id} dan ${json.decode(response.body)['name']}");
      // current_id = json.decode(response.body)['name'];
      // print("current_id : ${current_id}");
      // _items.insert(0, newProduct); // at the start of the list
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> updateCheck(String id, CheckInOutModel checkInOutModel) async {
    print("id : $id");
    final prodIndex = _checkInOut.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      final timeStamp = DateTime.now();
      final url = Uri.parse(
          'https://attendance-app-39a90-default-rtdb.asia-southeast1.firebasedatabase.app/checkInOut/$id.json?auth=$authToken');
      await http
          .patch(url,
              body: json.encode({
                'check-outTime': timeStamp.toIso8601String()
                // DateFormat('dd-MM-yyyy hh:mm a').format(timeStamp),
              }))
          .then((response) {
        if (response.statusCode >= 400) {
          throw HttpException('Failed to update check-out.');
        }
        ;
        _checkInOut[prodIndex] = checkInOutModel;
        notifyListeners();
      });
    } else {
      print('...');
    }
  }
}
