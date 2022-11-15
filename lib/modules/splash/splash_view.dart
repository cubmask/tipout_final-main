import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (_) => Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        body: SafeArea(
          child: SizedBox(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/tipout_light_logo_full.svg",
                    width: 100.0,
                    height: 400.0,
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    height: 10.0,
                    width: 100.0,
                    child: LinearProgressIndicator(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
