import 'package:dartz/dartz.dart';
import 'package:spacex_grathql_app/features/data/constants/enums.dart';

abstract class UseCase<T, P> {
  Future<Either<ErrorType, T>> call(P params);
}
