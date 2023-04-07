import 'package:flutter/material.dart';
import 'package:spacex_grathql_app/features/data/models/launch.dart';
import 'package:spacex_grathql_app/features/presentation/components/app_navigator.dart';
import 'package:spacex_grathql_app/features/presentation/components/app_text.dart';
import 'package:spacex_grathql_app/features/presentation/pages/detail/detail_page.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../core/utils/date_formater.dart';

class LaunchItemView extends StatelessWidget {
  final LauchModel lauchModel;
  const LaunchItemView({super.key, required this.lauchModel});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
          lauchModel.links?.videoLink ??
              "https://www.youtube.com/watch?v=cFGrdedhIQs")!,
      flags: const YoutubePlayerFlags(
          autoPlay: false, showLiveFullscreenButton: false, hideControls: true),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {
          AppNavigator.toNamed(DetailPage.route, arguments: {
            "videoLink": lauchModel.links?.videoLink,
            "id": lauchModel.id
          });
        },
        child: YoutubePlayerBuilder(
          player: YoutubePlayer(
            actionsPadding: const EdgeInsets.all(20),
            width: 200,
            controller: _controller,
            showVideoProgressIndicator: true,
            progressColors: const ProgressBarColors(
              playedColor: Colors.amber,
              handleColor: Colors.amberAccent,
            ),
          ),
          builder: (c, player) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: lauchModel.id ?? UniqueKey(),
                  child: SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: player,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppText(
                    lauchModel.missionName ?? "",
                    fontWeight: FontWeight.bold,
                    size: 16,
                    color: theme.primaryColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppText(
                    lauchModel.details ?? "",
                    color: theme.hintColor,
                    size: 14,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.bottomRight,
                  child: AppText(
                    DateDormater.dateToMobile(lauchModel.launchDateLocal) ?? "",
                    color: theme.primaryColor,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
