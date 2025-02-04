// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    // if (kIsWeb) {
    //   return web;
    // }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      // case TargetPlatform.macOS:
      //   return macos;
      // case TargetPlatform.windows:
      //   throw UnsupportedError(
      //     'DefaultFirebaseOptions have not been configured for windows - '
      //     'you can reconfigure this by running the FlutterFire CLI again.',
      //   );
      // case TargetPlatform.linux:
      //   throw UnsupportedError(
      //     'DefaultFirebaseOptions have not been configured for linux - '
      //     'you can reconfigure this by running the FlutterFire CLI again.',
      //   );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  // static const FirebaseOptions web = FirebaseOptions(
  //   apiKey: 'AIzaSyD8SGrhAUP0a2h0qOyOALmJSJ9_j6UXt3g',
  //   appId: '1:501116146845:web:abd5fcabc3a77ec4747074',
  //   messagingSenderId: '501116146845',
  //   projectId: 'pnu-parking',
  //   authDomain: 'pnu-parking.firebaseapp.com',
  //   databaseURL: 'https://pnu-parking-default-rtdb.firebaseio.com',
  //   storageBucket: 'pnu-parking.appspot.com',
  // );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBe-VXKZVvcGAi4nCkWxVcr7RvAdP1JMB8',
    appId: '1:501116146845:android:3a0d7e50fd2899b8747074',
    messagingSenderId: '501116146845',
    projectId: 'pnu-parking',
    databaseURL: 'https://pnu-parking-default-rtdb.firebaseio.com',
    storageBucket: 'pnu-parking.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCw0x3S1lScqT_roX7zTIml0A2B4iaFuAM',
    appId: '1:501116146845:ios:1bd21926a976be34747074',
    messagingSenderId: '501116146845',
    projectId: 'pnu-parking',
    databaseURL: 'https://pnu-parking-default-rtdb.firebaseio.com',
    storageBucket: 'pnu-parking.appspot.com',
    iosBundleId: 'com.example.pnuParking',
  );

  // static const FirebaseOptions macos = FirebaseOptions(
  //   apiKey: 'AIzaSyCw0x3S1lScqT_roX7zTIml0A2B4iaFuAM',
  //   appId: '1:501116146845:ios:3497b8e366019160747074',
  //   messagingSenderId: '501116146845',
  //   projectId: 'pnu-parking',
  //   databaseURL: 'https://pnu-parking-default-rtdb.firebaseio.com',
  //   storageBucket: 'pnu-parking.appspot.com',
  //   iosBundleId: 'com.example.pnuParking.RunnerTests',
  // );
}
