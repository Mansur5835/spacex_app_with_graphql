import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_grathql_app/core/utils/assets_meneger.dart';
import 'package:spacex_grathql_app/features/presentation/components/animations/slide_and_opasity_anim.dart';
import 'package:spacex_grathql_app/features/presentation/components/app_navigator.dart';
import 'package:spacex_grathql_app/features/presentation/pages/home/home_page.dart';
import 'package:spacex_grathql_app/features/presentation/pages/splash/cubit/splash_cubit.dart';
import '../../components/app_text.dart';

class SplashPage extends StatelessWidget {
  static const String route = "splash-page";

  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => SplashCubit()..init(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state == SplashState.loaded) {
            AppNavigator.toNamedAndOff(HomePage.route);
          }
        },
        child: Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          body: Center(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SlideAndOpasityAnim(
                opasityDuration: 700,
                slideDuration: 700,
                slideBegin: const Offset(0, 0.8),
                child: AppText(
                  "Welcome To",
                  color: theme.primaryColor,
                  size: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SlideAndOpasityAnim(
                  opasityDuration: 700,
                  slideDuration: 700,
                  slideBegin: const Offset(0, -0.8),
                  child: Image.asset(AssetsManager.images(name: "app-logo"))),
            ],
          )),
        ),
      ),
    );
  }
}
