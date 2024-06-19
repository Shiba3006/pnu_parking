import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  final String userId;
  final String title;
  final String body;
  final Timestamp timestamp;

  NotificationModel(
      {required this.userId,
      required this.title,
      required this.body,
      required this.timestamp});

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      userId: json['userId'],
      title: json['title'],
      body: json['body'],
      timestamp: json['timestamp'],
    );
  }
}
