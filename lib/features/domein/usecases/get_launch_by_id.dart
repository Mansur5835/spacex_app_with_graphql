import 'package:dartz/dartz.dart';
import 'package:spacex_grathql_app/features/domein/usecases/usecases.dart';
import '../../data/constants/enums.dart';
import '../../data/models/launch.dart';
import '../repository/ql_repository.dart';

class GetLauncheById extends UseCase<LauchModel, String> {
  late QlRepository qlRepository;

  GetLauncheById({required this.qlRepository});

  @override
  Future<Either<ErrorType, LauchModel>> call(String params) async {
    var result = await qlRepository.getLauncheById(launchId: params);

    if (result == null) {
      return const Left(ErrorType.networkError);
    }

    return Right(result);
  }
}
