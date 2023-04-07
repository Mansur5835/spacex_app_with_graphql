class AssetsManager {
  static String icon({required String name, String? format}) {
    return "assets/icons/$name.${format ?? "png"}";
  }

  static String images({required String name, String? format}) {
    return "assets/images/$name.${format ?? "png"}";
  }
}
