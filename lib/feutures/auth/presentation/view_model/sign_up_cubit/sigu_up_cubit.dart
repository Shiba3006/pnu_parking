import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pnu_parking/core/firebase_messaging/firebase_messaging.dart';
part 'sigu_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  bool isLoading = false;
  final _fireStore = FirebaseFirestore.instance;
  
  String? _uId;

  void signUpUser({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String id,
  }) async {
    emit(SignUpLoading());

    try {
      await createUser(email, password);
      if (_uId != null && userToken != null) {
        await setDataUser(firstName, lastName, email, id);
        emit(SignUpSuccess());
      } else {
        emit(SignUpError("User ID is null"));
      }
    } on FirebaseAuthException catch (e) {
      emit(SignUpError(e.message.toString()));
      print(e.message.toString());
    } catch (e) {
      emit(SignUpError(e.toString()));
      // print(e.toString());
    }
  }

  Future<void> createUser(String email, String password) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    _uId = FirebaseAuth.instance.currentUser?.uid;
  }

  Future<void> setDataUser(
    String firstName,
    String lastName,
    String email,
    String id,
  ) async {
    await _fireStore.collection("users").doc(_uId).set({
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'id': id,
      'token': userToken,
      'role': 'user',
    });
  }
}
