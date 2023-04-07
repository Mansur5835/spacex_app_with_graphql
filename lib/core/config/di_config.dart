import 'package:get_it/get_it.dart';
import 'package:spacex_grathql_app/features/data/local_source/local_storage.dart';
import 'package:spacex_grathql_app/features/domein/repository/ql_repository.dart';
import 'package:spacex_grathql_app/features/domein/usecases/get_lauches.dart';
import 'package:spacex_grathql_app/features/domein/usecases/get_launch_by_id.dart';
import 'package:spacex_grathql_app/features/presentation/cubits/app_theme_cubit.dart';
import 'package:spacex_grathql_app/features/presentation/pages/detail/cubit/detail_cubit.dart';
import 'package:spacex_grathql_app/features/presentation/pages/home/cubit/home_cubit.dart';

final di = GetIt.instance;

class DI {
  static Future<void> init() async {
    //blocs
    di.registerFactory(() => HomeCubit(getLaunches: di()));
    di.registerFactory(() => DetailCubit(getLauncheById: di()));
    di.registerFactory(() => AppThemeCubit(localStorage: di()));

    //cases
    di.registerLazySingleton(() => GetLaunches(qlRepository: di()));
    di.registerLazySingleton(() => GetLauncheById(qlRepository: di()));

    //repos
    di.registerLazySingleton(() => QlRepository());
    di.registerLazySingleton(() => LocalStorage());
  }
}
