import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pnu_parking/core/widgets/custom_app_bar.dart';
import 'package:pnu_parking/feutures/profile/presentation/view_model/profile_cubit/profile_cubit.dart';
import 'package:pnu_parking/feutures/profile/presentation/views/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Profile',
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is GetProfileSuccessState) {
            return  ProfileViewBody(
              profileUserModel: state.profileUserModel,
            );
          } else if (state is GetProfileErrorState) {
            return Center(
              child: Text(state.error),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
