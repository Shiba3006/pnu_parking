import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:pnu_parking/feutures/profile/data/models/profile_user_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  String? _uId;
   ProfileUserModel? profileUserModel;

  getUserData() async {
    emit(GetProfileLoadingState());
    _uId = FirebaseAuth.instance.currentUser?.uid;
    try {
      if (_uId != null) {
        DocumentSnapshot<Map<String, dynamic>> data = await FirebaseFirestore
            .instance
            .collection('users')
            .doc(_uId)
            .get();
        profileUserModel = ProfileUserModel(
          id: data.data()!['id'],
          firstName: data.data()!['first_name'],
          lastName: data.data()!['last_name'],
          email: data.data()!['email'],
          token: data.data()!['token'],
        );
        emit(GetProfileSuccessState(profileUserModel: profileUserModel!));
      }
    } on Exception catch (e) {
      emit(GetProfileErrorState(error: e.toString()));
    }
  }

}
