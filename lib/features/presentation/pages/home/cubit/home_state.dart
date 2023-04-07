part of 'home_cubit.dart';

abstract class HomeState {}

class Loading extends HomeState {}

class Loaded extends HomeState {
  List<LauchModel> listOfLaunches;
  Loaded(this.listOfLaunches);

  Loaded copyWith(Loaded state) {
    return Loaded(state.listOfLaunches);
  }
}

class Error extends HomeState {}
