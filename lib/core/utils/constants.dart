import 'package:firebase_database/firebase_database.dart';

class AppConstants {
  static const String kAdmin = 'admin';
  static const String kUser = 'user';

  static final DatabaseReference realDataReserve =
      FirebaseDatabase.instance.ref().child('RESERVE');

  static const String kFirebaseMessageAuthorizationKey =
      'AAAAdKzZlJ0:APA91bHTyik7wJCFLKoKx6JYOK-G5yFaQuH3tQDacNl_FrYM1Y4d_D74aZzw1sHp5BJ5wgLCVq4dNpG2agOMg1l_u59cybBj4vb7O8zKKqzApvz66G5XXIJJ6-oSODlFHrvWlkgJAhk1';
  static const String kFcmgoogleapi = 'https://fcm.googleapis.com/fcm/send';
  static const kHeadersList = {
    'Accept': '*/*',
    'Content-Type': 'application/json',
    'Authorization': 'key=${AppConstants.kFirebaseMessageAuthorizationKey}'
  };
}
