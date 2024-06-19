import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pnu_parking/core/widgets/custom_button.dart';
import 'package:pnu_parking/feutures/auth/presentation/view_model/sign_up_cubit/sigu_up_cubit.dart';
import 'package:pnu_parking/core/widgets/input_row_form.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.always;

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    idController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                'Sign Up',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontSize: 40,
                    ),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Please enter your information:',
                  ),
                ],
              ),
              const SizedBox(height: 40),
              InputRowForm(
                controller: firstNameController,
                icon: Icons.person,
                hintText: 'First name',
              ),
              const SizedBox(height: 20),
              InputRowForm(
                controller: lastNameController,
                icon: Icons.person,
                hintText: 'Last name',
              ),
              const SizedBox(height: 20),
              InputRowForm(
                controller: idController,
                icon: Icons.badge_outlined,
                hintText: 'ID',
                textInputType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              InputRowForm(
                controller: emailController,
                icon: Icons.email_outlined,
                hintText: 'Email',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              InputRowForm(
                controller: passwordController,
                icon: Icons.lock,
                hintText: 'password',
                isPassword: true,
              ),
              const SizedBox(height: 130),
              CustomButton(
                  title: 'Sign Up',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      BlocProvider.of<SignUpCubit>(context).signUpUser(
                        email: emailController.text,
                        password: passwordController.text,
                        firstName: firstNameController.text,
                        lastName: lastNameController.text,
                        id: idController.text,
                      );
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                    }
                  }),
            ],
          ),
        ),
      ),
    
    );
  
  }
}
