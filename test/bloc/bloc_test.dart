import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:spacex_grathql_app/features/domein/usecases/get_lauches.dart';
import 'package:spacex_grathql_app/features/domein/usecases/get_launch_by_id.dart';
import 'package:spacex_grathql_app/features/presentation/pages/home/cubit/home_cubit.dart';
import 'package:spacex_grathql_app/features/presentation/pages/splash/cubit/splash_cubit.dart';

class MockGetLaunches extends Mock implements GetLaunches {}

class MockGetLaunchById extends Mock implements GetLauncheById {}

void main() {
  late HomeCubit homeCubit;
  late SplashCubit splashCubit;
  MockGetLaunches mockGetLaunches;

  setUp(() {
    mockGetLaunches = MockGetLaunches();
    splashCubit = SplashCubit();
    homeCubit = HomeCubit(getLaunches: mockGetLaunches);
  });

  group("get lau", () {
    blocTest<HomeCubit, HomeState>(
      'when attempt to loading is made then error state is emitted',
      build: () => homeCubit,
      act: (cubit) => cubit.init(),
      expect: () => [Loading(), Error()],
    );

    blocTest<SplashCubit, SplashState>(
      'when attempt to loading is made then error state is emitted',
      build: () => splashCubit,
      act: (cubit) => splashCubit.init(),
      expect: () => [SplashState.none, SplashState.loaded],
    );
  });
}
