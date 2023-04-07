class LinksModel {
  String? videoLink;
  String? articleLink;
  String? wikipedia;
  List? flickrImages;

  LinksModel(
      this.articleLink, this.flickrImages, this.videoLink, this.wikipedia);

  // "video_link": "https://www.youtube.com/watch?v=0a_00nJ_Y88",
  // "articleLink": "https://www.space.com/2196-spacex-inaugural-falcon-1-rocket-lost-launch.html",
  // "wikipedia": "https://en.wikipedia.org/wiki/DemoSat",
  // "flickr_images": []

  LinksModel.fromJson(Map<String, dynamic> json) {
    videoLink = json["video_link"];
    articleLink = json["articleLink"];
    wikipedia = json["wikipedia"];
    flickrImages = json["flickr_images"];
  }
}
