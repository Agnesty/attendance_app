import 'package:flutter/material.dart';

class CheckInOutModel {
  final String? id;
  final String userId;
  final DateTime? checkInTime;
  final DateTime? checkOutTime;
  static double lat = 0;
  static double long = 0;

  CheckInOutModel({
    this.id,
    required this.userId,
    this.checkInTime,
    this.checkOutTime,
  });

  // factory CheckInOutModel.fromJson(Map<String, dynamic> json) {
  //   return CheckInOutModel(
  //     id: json['id'],
  //     userId: json['userId'],
  //     checkInTime: DateTime.parse(json['checkInTime']),
  //     checkOutTime: DateTime.parse(json['checkOutTime']),
  //   );
  // }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'userId': userId,
  //     'checkInTime': checkInTime!,
  //     'checkOutTime': checkOutTime!,
  //   };
  // }
}
