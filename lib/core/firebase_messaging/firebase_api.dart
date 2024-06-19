import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pnu_parking/core/firebase_messaging/firebase_messaging.dart';
import 'package:pnu_parking/core/utils/constants.dart';

class FirebaseApi {
  static Future sendNotificationViaFirebase(title, message) async {
    final url = Uri.parse(AppConstants.kFcmgoogleapi);
    var body = {
      "to": userToken,
      "notification": {
        "title": title,
        "body": message,
      }
    };
    var req = http.Request('POST', url);

    req.headers.addAll(AppConstants.kHeadersList);
    req.body = json.encode(body);

    var res = await req.send();
    final resBody = await res.stream.bytesToString();

    if (res.statusCode >= 200 && res.statusCode < 300) {
      print(resBody);
    } else {
      print(res.reasonPhrase);
    }
  }

  static Timer? _timer;
  static Future scheduleNotificationViaFirebase(title, message,
      {required Duration duration}) async {
    _timer = Timer(
      duration,
      () async {
        await sendNotificationViaFirebase(title, message);
        print('=========================>Timer fired');
      },
    );
  }

  static cancelScheduledNotification() {
    if (_timer!.isActive || _timer != null) {
      _timer!.cancel();
    }
    print('=========================>Timer canceled');
  }
}
