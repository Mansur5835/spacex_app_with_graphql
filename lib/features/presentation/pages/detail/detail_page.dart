import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_grathql_app/core/utils/size.dart';
import 'package:spacex_grathql_app/features/data/constants/enums.dart';
import 'package:spacex_grathql_app/features/presentation/components/app_navigator.dart';
import 'package:spacex_grathql_app/features/presentation/components/app_page.dart';
import 'package:spacex_grathql_app/features/presentation/components/app_text.dart';
import 'package:spacex_grathql_app/features/presentation/pages/detail/cubit/detail_cubit.dart';
import 'package:spacex_grathql_app/features/presentation/style/app_colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../core/config/di_config.dart';

class DetailPage extends AppPage<DetailCubit, DetailState> {
  static const String route = "detail-page";
  DetailPage({super.key}) : super(bloc: di<DetailCubit>()..init());

  @override
  Widget builder(BuildContext context, state) {
    final theme = Theme.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: (state.cases == Cases.loading)
          ? _loadingWidget(theme)
          : SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if (state.cases == Cases.none) ...{
                      _playerView(state, context),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _name(state, theme),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _description(state, theme),
                      ),
                    } else if (state.cases == Cases.error) ...{
                      _errorCase(theme, context)
                    }
                  ],
                ),
              ),
            ),
    );
  }

  Container _loadingWidget(ThemeData theme) {
    return Container(
        height: size.height,
        alignment: Alignment.center,
        child: CircularProgressIndicator(
          color: theme.primaryColor,
        ));
  }

  Container _errorCase(ThemeData theme, BuildContext context) {
    return Container(
      height: 300,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText(
            "Some Error. Plaese Try Again!",
            color: theme.primaryColor,
          ),
          MaterialButton(
            color: AppColors.grey,
            onPressed: () {
              context.read<DetailCubit>().fetchAgain();
            },
            child: AppText("Try"),
          ),
        ],
      ),
    );
  }

  Widget _name(DetailState state, ThemeData theme) {
    return Container(
      alignment: Alignment.centerLeft,
      child: AppText(
        "Rocket: ${state.lauchModel?.rocket?["rocket_name"] ?? ""}",
        color: theme.primaryColor,
        size: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _description(DetailState state, ThemeData theme) {
    return Container(
      alignment: Alignment.centerLeft,
      child: AppText(
        state.lauchModel?.details ?? "",
        color: theme.primaryColor,
      ),
    );
  }

  Widget _playerView(DetailState state, BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
          state.lauchModel?.links?.videoLink ??
              "https://www.youtube.com/watch?v=cFGrdedhIQs")!,
      flags: const YoutubePlayerFlags(autoPlay: true),
    );

    var _player = YoutubePlayer(
      controller: _controller,
    );
    return SizedBox(
        height: 300,
        child: Stack(
          children: [
            Hero(
              tag: context.read<DetailCubit>().arguments?.id ?? UniqueKey(),
              child: SizedBox(
                width: double.infinity,
                height: 300,
                child: _player,
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                splashRadius: 20,
                icon: Icon(
                  Icons.clear,
                  color: AppColors.white,
                ),
                onPressed: () {
                  AppNavigator.back();
                },
              ),
            ),
          ],
        ));
  }
}
