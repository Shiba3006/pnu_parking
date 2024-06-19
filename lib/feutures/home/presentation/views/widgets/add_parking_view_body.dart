import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pnu_parking/core/widgets/custom_button.dart';
import 'package:pnu_parking/core/widgets/input_row_form.dart';
import 'package:pnu_parking/feutures/home/presentation/view_models/add_parking_cubit/add_parking_cubit.dart';

class AddParkingViewBody extends StatefulWidget {
  const AddParkingViewBody({super.key});

  @override
  State<AddParkingViewBody> createState() => _AddParkingViewBodyState();
}

class _AddParkingViewBodyState extends State<AddParkingViewBody> {
  TextEditingController idController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.always;

  @override
  void dispose() {
    super.dispose();
    idController.dispose();
    typeController.dispose();
    locationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddParkingCubit, AddParkingState>(
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AddParkingLoadingState,
          child: Padding(
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
                      'Admin Panel',
                      textAlign: TextAlign.center,
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                fontSize: 40,
                              ),
                    ),
                    const SizedBox(height: 60),
                    InputRowForm(
                      controller: idController,
                      icon: Icons.branding_watermark_rounded,
                      hintText: 'Parking ID',
                    ),
                    const SizedBox(height: 20),
                    InputRowForm(
                      controller: typeController,
                      icon: Icons.format_align_center_rounded,
                      hintText: 'Parking type',
                    ),
                    const SizedBox(height: 20),
                    InputRowForm(
                      controller: locationController,
                      icon: Icons.location_on_rounded,
                      hintText: 'Parking location',
                      textInputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 130),
                    CustomButton(
                        title: 'Add Parking',
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            await BlocProvider.of<AddParkingCubit>(context)
                                .addParking(
                              id: idController.text,
                              type: typeController.text,
                              location: locationController.text,
                            )
                                .then((value) {
                              idController.clear();
                              typeController.clear();
                              locationController.clear();
                            });
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                          }
                        }),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
