import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:spacex_grathql_app/core/config/ql_config.dart';
import 'package:spacex_grathql_app/features/data/models/launch.dart';
import '../../data/constants/ql_const.dart';

part 'ql_repository.i.dart';

abstract class QlRepository {
  factory QlRepository() {
    return _QlRepository(qlClient.value);
  }
  Future<List<LauchModel>?> getLaunches(
      {required int limit, required int offset});

  Future<LauchModel?> getLauncheById({required String launchId});
}
