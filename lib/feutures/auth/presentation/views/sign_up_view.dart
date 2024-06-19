import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pnu_parking/core/utils/app_functions.dart';
import 'package:pnu_parking/feutures/auth/presentation/view_model/sign_up_cubit/sigu_up_cubit.dart';
import 'package:pnu_parking/core/widgets/custom_app_bar.dart';
import 'package:pnu_parking/feutures/auth/presentation/views/widgets/sign_up_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pnu_parking/feutures/home/presentation/views/home_view.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          Get.offAll(() => const HomeView());
        } else if (state is SignUpError) {
          AppFunctions.buildSnackBar(title: 'Error', message: state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignUpLoading,
          child: const Scaffold(
            appBar: CustomAppBar(),
            body: SignUpViewBody(),
          ),
        );
      },
    );
  }
}
