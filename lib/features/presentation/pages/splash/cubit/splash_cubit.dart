import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_grathql_app/core/extansions/duration.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState.none);

  void init() {
    Future.delayed(2000.onDur, () {
      emit(SplashState.loaded);
    });
  }
}
