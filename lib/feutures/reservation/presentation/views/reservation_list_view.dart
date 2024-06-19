import 'package:flutter/material.dart';
import 'package:pnu_parking/feutures/reservation/presentation/views/widgets/reservations_list_view_body.dart';

class ReservationsListView extends StatelessWidget {
  const ReservationsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ReservationsListViewBody(),
    );
  }
}
