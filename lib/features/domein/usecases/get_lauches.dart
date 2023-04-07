import 'package:spacex_grathql_app/features/data/constants/enums.dart';
import 'package:dartz/dartz.dart';
import 'package:spacex_grathql_app/features/data/models/launch.dart';
import 'package:spacex_grathql_app/features/data/models/pagination.dart';
import 'package:spacex_grathql_app/features/domein/repository/ql_repository.dart';
import 'package:spacex_grathql_app/features/domein/usecases/usecases.dart';

class GetLaunches extends UseCase<List<LauchModel>, PaginationModel> {
  late QlRepository qlRepository;

  GetLaunches({required this.qlRepository});

  @override
  Future<Either<ErrorType, List<LauchModel>>> call(
      PaginationModel params) async {
    var result = await qlRepository.getLaunches(
        limit: params.limit, offset: params.offset);

    if (result == null) {
      return const Left(ErrorType.networkError);
    }

    return Right(result);
  }
}
