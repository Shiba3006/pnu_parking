import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pnu_parking/core/widgets/custom_button.dart';
import 'package:pnu_parking/feutures/auth/presentation/view_model/sign_in_cubit/sign_in_cubit.dart';
import 'package:pnu_parking/core/widgets/custom_text_form_field.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.always;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                'Sign In',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontSize: 40,
                    ),
              ),
              const SizedBox(height: 150),
              CustomTextFormField(
                onChanged: (value) {
                  emailController.text = value;
                },
                controller: emailController,
                hintText: ' Email',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                onChanged: (value) {
                  passwordController.text = value;
                },
                controller: passwordController,
                hintText: ' Password ',
                isPassword: true,
              ),
              const SizedBox(height: 150),
              CustomButton(
                title: 'Sign In',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    BlocProvider.of<SignInCubit>(context).signIn(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  
  }
}
