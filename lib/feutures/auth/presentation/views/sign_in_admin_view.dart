import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pnu_parking/core/utils/app_functions.dart';
import 'package:pnu_parking/feutures/auth/presentation/view_model/sign_in_cubit/sign_in_cubit.dart';
import 'package:pnu_parking/core/widgets/custom_app_bar.dart';
import 'package:pnu_parking/feutures/auth/presentation/views/widgets/sign_in_admin_view_body.dart';
import 'package:pnu_parking/feutures/home/presentation/views/admin_home_view.dart';

class SignInAdminView extends StatelessWidget {
  const SignInAdminView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInAdminErrorState) {
          AppFunctions.buildSnackBar(title: 'Error', message: state.error);
        }
        if (state is SignInAdminSuccessState) {
          Get.offAll(() => const AdminHomeView());
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignInAdminLoadingState,
          child: const Scaffold(
            appBar: CustomAppBar(),
            body: SignInAdminViewBody(),
          ),
        );
      },
    );
  }
}
