import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_grathql_app/core/utils/size.dart';
import 'package:spacex_grathql_app/features/presentation/components/animations/slide_and_opasity_anim.dart';
import 'package:spacex_grathql_app/features/presentation/components/app_dialog.dart';
import 'package:spacex_grathql_app/features/presentation/components/app_page.dart';
import 'package:spacex_grathql_app/features/presentation/components/views/launch_item_view.dart';
import 'package:spacex_grathql_app/features/presentation/components/views/warning_view.dart';
import 'package:spacex_grathql_app/features/presentation/cubits/app_theme_cubit.dart';
import 'package:spacex_grathql_app/features/presentation/pages/home/cubit/home_cubit.dart';

import '../../../../core/config/di_config.dart';
import '../../components/app_text.dart';
import '../../components/loading_more_widget.dart';
import '../../components/views/preference_view.dart';
import '../../style/app_colors.dart';

class HomePage extends AppPage<HomeCubit, HomeState> {
  static const String route = "/";
  HomePage({super.key}) : super(bloc: di<HomeCubit>()..init());
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final ScrollController scrollController = ScrollController();

  @override
  Widget builder(BuildContext context, state) {
    final theme = Theme.of(context);
    return Scaffold(
        key: scaffoldKey,
        drawer: _drawer(theme),
        backgroundColor: theme.scaffoldBackgroundColor,
        body: SafeArea(
          child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [_appBar(theme)];
              },
              body: _cases(state, context)),
        ));
  }

  SliverAppBar _appBar(ThemeData theme) {
    return SliverAppBar(
      actions: [
        IconButton(
          splashRadius: 20,
          iconSize: 30,
          icon: Icon(
            Icons.search,
            color: theme.primaryColor,
          ),
          onPressed: () {},
        )
      ],
      leading: IconButton(
        splashRadius: 20,
        icon: Icon(
          Icons.dehaze_rounded,
          color: theme.primaryColor,
        ),
        onPressed: () {
          scaffoldKey.currentState!.openDrawer();
        },
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      centerTitle: true,
      title: AppText(
        "Flights",
        color: theme.primaryColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _cases(HomeState state, BuildContext context) {
    final theme = Theme.of(context);
    if (state is Loaded) {
      return ListView(
        shrinkWrap: true,
        controller: scrollController,
        children: [
          LoadMoreWidget(
            parentScrollController: scrollController,
            loadMore: () async {
              await context.read<HomeCubit>().loadMore();
            },
            items: List.generate(state.listOfLaunches.length, (index) {
              return LaunchItemView(lauchModel: state.listOfLaunches[index]);
            }),
          )
        ],
      );
    }

    return Center(
      child: CircularProgressIndicator(
        color: theme.primaryColor,
      ),
    );
  }

  Widget _drawer(ThemeData theme) {
    return Container(
      color: theme.scaffoldBackgroundColor,
      width: size.width - 50,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        children: [
          SlideAndOpasityAnim(
              slideBegin: const Offset(0, -0.2),
              opasityDuration: 100,
              slideDuration: 600,
              child: _header()),
          const SizedBox(
            height: 10,
          ),
          AppText(
            "Preferences",
            size: 20,
            color: theme.primaryColor,
          ),
          Divider(
            color: theme.primaryColor,
          ),
          _preferences(theme)
        ],
      ),
    );
  }

  Widget _preferences(ThemeData theme) {
    return Column(
      children: [
        const SlideAndOpasityAnim(
          slideDuration: 400,
          opasityDuration: 200,
          child: ProfileItemView(
            icon: Icons.translate,
            title: "Languages",
          ),
        ),
        const SlideAndOpasityAnim(
            slideDuration: 500,
            opasityDuration: 200,
            child: ProfileItemView(
              icon: Icons.security,
              title: "Security",
            )),
        const SlideAndOpasityAnim(
            slideDuration: 600,
            opasityDuration: 200,
            child: ProfileItemView(
              icon: Icons.notifications,
              title: "Notification",
            )),
        SlideAndOpasityAnim(
            slideDuration: 700,
            opasityDuration: 200,
            child: BlocBuilder<AppThemeCubit, AppThemeState>(
              builder: (context, state) {
                return ProfileItemView(
                  leading: "night-mode",
                  title: "Dark-Mode",
                  trailing: CupertinoSwitch(
                      activeColor: AppColors.primaryColor,
                      value: state.isDark,
                      onChanged: (value) {
                        context.read<AppThemeCubit>().swicheTheme(value);
                      }),
                );
              },
            )),
        SlideAndOpasityAnim(
            slideDuration: 800,
            opasityDuration: 200,
            child: ProfileItemView(
              onTab: () {
                AppDialog(
                    child: WarringView(
                  warningText: "Are you logging out?",
                  yesTab: () {
                    exit(0);
                  },
                )).show();
              },
              icon: Icons.exit_to_app,
              title: "Exit",
            )),
      ],
    );
  }

  Container _header() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: AppColors.grey),
      child: Icon(
        Icons.person,
        size: 85,
        color: AppColors.blackGrey1,
      ),
    );
  }
}
