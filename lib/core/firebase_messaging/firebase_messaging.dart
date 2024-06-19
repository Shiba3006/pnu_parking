import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

String? userToken;
// Function to handle messages when app is in the background or terminated
Future<void> handleMessageInBackgroundOrTerminated(
  RemoteMessage message,
) async {
  print('Title: ${message.notification?.title}');
  print('Body: ${message.notification?.body}');
  print('Payload  : ${message.data}');
  saveNotificationInFireStore(
    title: message.notification?.title,
    body: message.notification?.body,
  );
}

Future<void> saveNotificationInFireStore({
  String? title,
  String? body,
}) async {
  try {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance.collection('notifications').add({
      'userId': userId,
      'title': title,
      'body': body,
      'timestamp': FieldValue.serverTimestamp(),
    });
    print('Notification saved to Firestore: $title - $body');
  } catch (e) {
    print('Error saving notification to Firestore: $e');
  }
}

void notificationTapBackground(NotificationResponse notificationResponse) {
  print('notificationTapBackground: ${notificationResponse.id}');
}

class MyFirebaseMessaging {
  final _firebaseMessaging = FirebaseMessaging.instance;

  final _androidChannel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.defaultImportance,
  );
  final _localNotifications = FlutterLocalNotificationsPlugin();

  // Function to handle messages when app is in the foreground
  void handleMessageInForeground(RemoteMessage? message) {
    if (message == null) return;
    saveNotificationInFireStore(
      title: message.notification?.title,
      body: message.notification?.body,
    );
  }

  Future initLocalNotifications() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const settings = InitializationSettings(
      android: android,
    );

    await _localNotifications.initialize(
      settings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) async {
        if (notificationResponse.notificationResponseType ==
            NotificationResponseType.selectedNotification) {
          final message =
              RemoteMessage.fromMap(jsonDecode(notificationResponse.payload!));
          handleMessageInForeground(message);
        }
      },
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );
    final platform = _localNotifications.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(_androidChannel);
  }

  void initNotificationsReaching() {
    // for background notification reaching
    FirebaseMessaging.onBackgroundMessage(
        handleMessageInBackgroundOrTerminated);
    // Handle foreground messages reaching
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print('Got a message whilst in the foreground!');
      final notification = message.notification;
      if (notification == null) return;
      handleMessageInForeground(message);
      await _localNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
            android: AndroidNotificationDetails(
          _androidChannel.id,
          _androidChannel.name,
          importance: Importance.max,
          priority: Priority.high,
          channelDescription: _androidChannel.description,
          icon: '@mipmap/ic_launcher',
          chronometerCountDown: true,
          channelShowBadge: false,
        )),
        payload: jsonEncode(message.toMap()),
      );
    });
  }

  void initNotificationsInteraction() {
    // for terminated app notification interaction
    FirebaseMessaging.instance
        .getInitialMessage()
        .then(handleMessageInForeground);
    // for background app notification interaction
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // Handle background messages when app is opened from terminated state
      handleMessageInBackgroundOrTerminated(message);
    });
  }

  Future initPushNotifications() async {
    await FirebaseMessaging.instance.setAutoInitEnabled(true);
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      sound: true,
    );
    initNotificationsInteraction();
    initNotificationsReaching();
  }

  Future<void> getDeviceToken() async {
    final fCMToken = await _firebaseMessaging.getToken();
    userToken = fCMToken.toString();
    print('Token:=====================> $fCMToken');
  }

  Future<void> isRefreshDeviceToken() async {
    _firebaseMessaging.onTokenRefresh.listen((token) {
      userToken = token.toString();
      print('Token refreshed');
    });
  }

  Future<void> initNotifications() async {
    // Request permission for receiving notifications
    await _firebaseMessaging.requestPermission(provisional: true);
    await isRefreshDeviceToken();
    await getDeviceToken();
    initPushNotifications();
    initLocalNotifications();
  }
}
