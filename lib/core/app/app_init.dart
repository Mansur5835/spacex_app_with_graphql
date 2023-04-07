import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import '../../features/data/local_source/local_storage.dart';

class AppInit {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    ///hive service
    await Hive.initFlutter();
    await Hive.openBox(LocalStorage.BOX_NAME);
    // DioUtils.settingDio();
  }
}
