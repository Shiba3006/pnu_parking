import 'package:flutter/material.dart';
import 'package:pnu_parking/core/utils/app_assets.dart';
import 'package:pnu_parking/feutures/station/data/colors_pallete.dart';
import 'package:pnu_parking/feutures/station/presentaion/views/widgets/off_container.dart';
import 'package:pnu_parking/feutures/station/presentaion/views/widgets/on_container.dart';

class StationSignal extends StatelessWidget {
  const StationSignal({
    super.key,
    required this.isOn,
  });
  final bool isOn;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 350,
        color: Colors.transparent,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(
              AppAssets.kSignal,
              fit: BoxFit.cover,
              height: 400,
            ),
            Positioned(
              // green Signal
              bottom: 100,
              child: isOn
                  ? OnContainer(
                      colorWithOpacity: ColorsPallete.kGreenColorOpacity,
                      colorsList: ColorsPallete.kGreenColorLis,
                    )
                  : OffContainer(color: ColorsPallete.kDarkGreen),
            ),
            Positioned(
              // red Signal
              bottom: 220,
              child: isOn
                  ? OffContainer(color: ColorsPallete.kDarkRed)
                  : OnContainer(
                      colorWithOpacity: ColorsPallete.kRedColorOpacity,
                      colorsList: ColorsPallete.kRedColorLis,
                    ),
              // OnContainer(),
            ),
          ],
        ),
      ),
    );
  }
}
