import 'package:spacex_grathql_app/features/data/models/links.dart';

class LauchModel {
  String? missionName;
  String? details;
  String? id;
  LinksModel? links;
  String? launchDateLocal;
  Map? rocket;

  LauchModel(this.details, this.id, this.missionName, this.links,
      this.launchDateLocal, this.rocket);

//  "launch": {
//             "id": "5eb87cd9ffd86e000604b32a",
//             "details": "Engine failure at 33 seconds and loss of vehicle",
//             "launch_date_local": "2006-03-25T10:30:00+12:00",
//             "links": {
//                 "article_link": "https://www.space.com/2196-spacex-inaugural-falcon-1-rocket-lost-launch.html",
//                 "wikipedia": "https://en.wikipedia.org/wiki/DemoSat",
//                 "flickr_images": []
//             },
//             "rocket": {
//                 "rocket_name": "Falcon 1"
//             }
//         }

  Map<String, dynamic> toJson() {
    return {
      "mission_name": missionName,
      "details": details,
      "id": id,
      "links": links,
      "rocket": rocket
    };
  }

  LauchModel.fromJson(Map<String, dynamic> json) {
    missionName = json["mission_name"];
    id = json["id"];
    links = LinksModel.fromJson(json["links"] ?? {});
    details = json["details"];
    launchDateLocal = json["launch_date_local"];
    rocket = json["rocket"];
  }
}
