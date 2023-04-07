import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:spacex_grathql_app/core/app/app_init.dart';
import 'package:spacex_grathql_app/core/config/di_config.dart';
import 'package:spacex_grathql_app/core/config/ql_config.dart';
import 'features/presentation/cubits/app_theme_cubit.dart';
import 'features/presentation/pages/splash/splash_page.dart';
import 'features/presentation/routes/routes.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main(List<String> args) async {
  await AppInit.init();
  DI.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BlocProvider(
        create: (context) => di<AppThemeCubit>()..init(),
        child: BlocBuilder<AppThemeCubit, AppThemeState>(
          builder: (context, state) {
            return GraphQLProvider(
              client: qlClient,
              child: MaterialApp(
                title: "SpaceX App",
                debugShowCheckedModeBanner: false,
                theme: state.themeData,
                navigatorKey: navigatorKey,
                initialRoute: SplashPage.route,
                onGenerateRoute: RouteManager.generateRoute,
              ),
            );
          },
        ),
      ),
    );
  }
}
