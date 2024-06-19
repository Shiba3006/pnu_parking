import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pnu_parking/core/utils/app_functions.dart';
import 'package:pnu_parking/feutures/auth/presentation/view_model/sign_in_cubit/sign_in_cubit.dart';
import 'package:pnu_parking/core/widgets/custom_app_bar.dart';
import 'package:pnu_parking/feutures/auth/presentation/views/widgets/sign_in_view_body.dart';
import 'package:pnu_parking/feutures/home/presentation/views/home_view.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInErrorState) {
          AppFunctions.buildSnackBar(title: 'Error', message: state.error);
        }
        if (state is SignInSuccessState) {
          Get.offAll(() => const HomeView());
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignInLoadingState,
          child: const Scaffold(
            appBar: CustomAppBar(),
            body: SignInViewBody(),
          ),
        );
      },
    );
  }
}
