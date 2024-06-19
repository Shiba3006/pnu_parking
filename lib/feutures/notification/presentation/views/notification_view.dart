import 'package:flutter/material.dart';
import 'package:pnu_parking/feutures/notification/presentation/views/widgets/notification_view_body.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: NotificationViewBody()),
    );
  }
}

