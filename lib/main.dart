import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pnu_parking/core/app/app_observer.dart';
import 'package:pnu_parking/core/app/pnu_parking.dart';
import 'package:pnu_parking/core/app/firebase_options.dart';
import 'package:pnu_parking/core/firebase_messaging/firebase_messaging.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await MyFirebaseMessaging().initNotifications();

  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
  
  Bloc.observer = AppObserver();
  runApp(const PnuParking());
}
