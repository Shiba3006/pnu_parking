import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pnu_parking/feutures/station/presentaion/view_model/station_cubit/station_cubit.dart';
import 'package:pnu_parking/feutures/station/presentaion/views/widgets/station_signal.dart';

class StationWidget extends StatelessWidget {
  const StationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StationCubit, StationState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = BlocProvider.of<StationCubit>(context);
        return Column(
          children: [
            state is GetStationDataLoading
                ? const SizedBox(
                    height: 350,
                    child: Center(child: CircularProgressIndicator()))
                : StationSignal(isOn: cubit.isEmpty!),
            const SizedBox(
              height: 20,
            ),
            state is GetStationDataLoading
                ? const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 80),
                    child: LinearProgressIndicator(),
                  )
                : Text(
                    'Parking is ${cubit.isEmpty! ? 'empty now' : 'booked up now'}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
          ],
        );
      },
    );
  }
}
