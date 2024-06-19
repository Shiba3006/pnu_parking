import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:pnu_parking/feutures/reservation/data/models/reservation_model.dart';

part 'reservation_state.dart';

class ReservationCubit extends Cubit<ReservationState> {
  ReservationCubit() : super(ReservationInitial());

  addReservations() async {
    emit(AddReservationLoadingState());
    String userId = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance.collection('reservations').add({
      'userId': userId,
      'timestamp': FieldValue.serverTimestamp(),
      'stationName': 'A1',
    }).then((value) {
      emit(AddReservationSuccessState());
    }).catchError((e) {
      emit(AddReservationErrorState(message: e.toString()));
    });
  }

  getReservations() async {
    emit(GetReservationLoadingState());
    String userId = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection('reservations')
        .where('userId', isEqualTo: userId)
        .orderBy('timestamp', descending: true)
        .get()
        .then((value) {
      print('==========================> ${value.docs}');
      emit(GetReservationSuccessState(
          reservationList: value.docs
              .map((e) => ReservationModel.fromJson(e.data()))
              .toList()));
    }).catchError((e) {
      emit(GetReservationErrorState(message: e.toString()));
    });
  }

  clearNotifications() async {
    emit(ClearReservationLoadingState());
    String userId = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection('reservations')
        .where(
          'userId',
          isEqualTo: userId,
        )
        .get()
        .then((value) {
      for (var element in value.docs) {
        element.reference.delete();
      }

      emit(ClearReservationSuccessState());
    }).catchError((e) {
      emit(ClearReservationErrorState(message: e.toString()));
    });
  }
}
