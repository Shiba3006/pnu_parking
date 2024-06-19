import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'add_parking_state.dart';

class AddParkingCubit extends Cubit<AddParkingState> {
  AddParkingCubit() : super(AddParkingInitial());

  Future<void> addParking({
    required String id,
    required String type,
    required String location,
  }) async {
    emit(AddParkingLoadingState());
    await FirebaseFirestore.instance.collection('parking').add({
      'id': id,
      'type': type,
      'location': location,
    }).then((value) {
      emit(AddParkingSuccessState());
    }).catchError((e) {
      emit(AddParkingErrorState(error: e.toString()));
    });
  }
}
