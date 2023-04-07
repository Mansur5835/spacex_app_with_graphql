abstract class QlConst {
  static const String url = 'https://spacex-production.up.railway.app/';

  static const String launchesQuery = """
query Launches(\$offset: Int, \$limit: Int) {
  launches(offset: \$offset, limit: \$limit) {
    mission_name
    links {
      video_link
    }
    id
    details
    launch_date_local
  }
}
""";

  static const String launcheByIdQuery = """
query Launches(\$launchId: ID!) {
  launch(id: \$launchId) {
    id
    details
    launch_date_local
    links {
      video_link
      article_link
      wikipedia
      flickr_images
    }
    rocket {
      rocket_name
    }
  }
}
""";
}
