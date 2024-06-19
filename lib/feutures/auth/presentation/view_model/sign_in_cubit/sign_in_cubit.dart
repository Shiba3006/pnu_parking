
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:pnu_parking/core/utils/app_functions.dart';
import 'package:pnu_parking/core/utils/constants.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());
  late String role;

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    emit(SignInLoadingState());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(SignInSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(SignInErrorState(error: e.toString()));
    } catch (e) {
      emit(SignInErrorState(error: e.toString()));
    }
  }

  Future<void> signInAdmin({
    required String email,
    required String password,
  }) async {
    emit(SignInAdminLoadingState());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await checkUserRole(FirebaseAuth.instance.currentUser!.uid).then((value) {
        if (role == AppConstants.kAdmin) {
          emit(SignInAdminSuccessState());
        } else {
          FirebaseAuth.instance.signOut();
          AppFunctions.buildSnackBar(
            title: 'Admin permission',
            message:
                'You are not an admin, please try again or contact developer',
          );
          emit(SignInAdminNotAllowedState());
        }
      });
    } on FirebaseAuthException catch (e) {
      emit(SignInAdminErrorState(error: e.toString()));
    } catch (e) {
      emit(SignInAdminErrorState(error: e.toString()));
    }
  }

  checkUserRole(String uid) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((value) {
      role = value.data()!['role'];
      print('=========================> $role');
    }).catchError((e) {
      print(e);
    });
  }
}
