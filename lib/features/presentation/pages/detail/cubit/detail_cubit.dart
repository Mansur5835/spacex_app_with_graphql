import 'package:spacex_grathql_app/features/data/models/launch.dart';
import 'package:spacex_grathql_app/features/domein/usecases/get_launch_by_id.dart';
import 'package:spacex_grathql_app/features/presentation/components/app_navigator.dart';

import '../../../../data/constants/enums.dart';
import '../../../components/app_cubit.dart';

part 'detail_state.dart';

class DetailCubit extends AppCubit<DetailState> {
  DetailCubit({required this.getLauncheById}) : super(DetailState());

  final GetLauncheById getLauncheById;

  Arguments? arguments;

  @override
  void init() {
    arguments = Arguments.fromJson(args.get);
    _loadData();
  }

  _loadData() async {
    emit(state.copyWith(
      state
        ..cases = Cases.loading
        ..videoLink = arguments?.videoLink,
    ));
    var result = await getLauncheById(arguments?.id ?? "");

    result.fold(
      (l) {
        emit(state.copyWith(state..cases = Cases.error));
      },
      (r) {
        emit(state.copyWith(state
          ..cases = Cases.none
          ..lauchModel = r));
      },
    );
  }

  fetchAgain() {
    _loadData();
  }
}

class Arguments {
  String? videoLink;
  String? id;

  Arguments.fromJson(Map json) {
    videoLink = json["videoLink"];
    id = json["id"];
  }
}
