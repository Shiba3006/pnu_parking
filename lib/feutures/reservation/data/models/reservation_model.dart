import 'package:cloud_firestore/cloud_firestore.dart';

class ReservationModel {
  final String userId;
  final String stationName;
  final Timestamp time;

  ReservationModel({
    required this.userId,
    required this.stationName,
    required this.time,
  });

  factory ReservationModel.fromJson(Map<String, dynamic> json) {
    return ReservationModel(
      userId: json['userId'],
      stationName: json['stationName'],
      time: json['timestamp'],
    );
  }
}
