import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pnu_parking/core/utils/app_functions.dart';
import 'package:pnu_parking/core/widgets/custom_app_bar.dart';
import 'package:pnu_parking/feutures/home/presentation/view_models/add_parking_cubit/add_parking_cubit.dart';
import 'package:pnu_parking/feutures/home/presentation/views/widgets/add_parking_view_body.dart';

class AddParkingView extends StatelessWidget {
  const AddParkingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddParkingCubit, AddParkingState>(
      listener: (context, state) {
        if (state is AddParkingSuccessState) {
          AppFunctions.buildSnackBar(
            title: 'Admin Panel',
            message: 'Success add parking',
          );
        }
        if (state is AddParkingErrorState) {
          AppFunctions.buildSnackBar(
            title: 'Admin Panel',
            message: state.error,
          );
        }
        
      },
      child: const Scaffold(
        appBar: CustomAppBar(title: 'Add Parking'),
        body: AddParkingViewBody(),
      ),
    );
  }
}
