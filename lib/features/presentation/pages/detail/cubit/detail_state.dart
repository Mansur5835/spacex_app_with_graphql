part of 'detail_cubit.dart';

class DetailState {
  Cases cases;
  LauchModel? lauchModel;
  String? videoLink;

  DetailState([this.cases = Cases.none, this.lauchModel, this.videoLink]);

  DetailState copyWith(DetailState state) {
    return DetailState(state.cases, state.lauchModel, state.videoLink);
  }
}
