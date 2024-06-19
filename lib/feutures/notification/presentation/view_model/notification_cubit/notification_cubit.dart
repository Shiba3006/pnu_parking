import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:pnu_parking/core/firebase_messaging/firebase_api.dart';
import 'package:pnu_parking/core/utils/constants.dart';
import 'package:pnu_parking/feutures/notification/data/models/notification_model.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  final _data = AppConstants.realDataReserve;
  bool? isEmpty;
  List<NotificationModel> notificationList = [];

  getNotificationsFromFirestore() async {
    emit(GetNotificationLoadingState());
    try {
      String userId = FirebaseAuth.instance.currentUser!.uid;
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('notifications')
              .where(
                'userId',
                isEqualTo: userId,
              )
              .orderBy('timestamp', descending: true)
              .get();
      List<QueryDocumentSnapshot<Map<String, dynamic>>> dataList =
          querySnapshot.docs;

      notificationList =
          dataList.map((e) => NotificationModel.fromJson(e.data())).toList();
      emit(GetNotificationSuccessState(
        notificationsListModel: notificationList,
      ));
    } catch (e) {
      emit(GetNotificationErrorState(error: e.toString()));
    }
  }

  sendNotificationFromMovingOnSensor() async {
    emit(GetNotificationFromMovingOnSensorLoadingState());
    try {
      FirebaseApi.sendNotificationViaFirebase(
        'SENSOR DETECTED',
        'Are you here?',
      );
      emit(GetNotificationFromMovingOnSensorSuccessState());
    } catch (e) {
      emit(GetNotificationFromMovingOnSensorErrorState(error: e.toString()));
    }
  }

  void getMovingOnSensor() {
    emit(GetMovingOnSensorLoadingState());
    _data.onValue.listen(
      (event) {
        Map data = event.snapshot.value as Map;
        for (var element in data.keys) {
          if (element == 'ESP2') {
            if (data[element] == 0) {
              print('=========================>sensor on');
              sendNotificationFromMovingOnSensor();
            }
            isEmpty = data[element] == 1 ? true : false;
          }
        }
      },
      onDone: () {
        emit(GetMovingOnSensorSuccessState());
      },
      onError: (error) {
        emit(GetMovingOnSensorErrorState(error: error.toString()));
      },
    );
  }

  clearNotifications() async {
    emit(ClearNotificationsLoadingState());
    String userId = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection('notifications')
        .where(
          'userId',
          isEqualTo: userId,
        )
        .get()
        .then((value) {
      for (var element in value.docs) {
        element.reference.delete();
      }
      notificationList = [];
      emit(ClearNotificationsSuccessState());
    }).catchError((e) {
      emit(ClearNotificationsErrorState(error: e.toString()));
    });
  }
}
