import 'package:spacex_grathql_app/features/data/models/launch.dart';
import 'package:spacex_grathql_app/features/data/models/pagination.dart';
import 'package:spacex_grathql_app/features/domein/usecases/get_lauches.dart';

import '../../../components/app_cubit.dart';

part 'home_state.dart';

class HomeCubit extends AppCubit<HomeState> {
  HomeCubit({required this.getLaunches}) : super(Loading());

  final GetLaunches getLaunches;

  PaginationModel _paginationModel = PaginationModel();

  @override
  void init() {
    _loadData();
  }

  _loadData() async {
    emit(Loading());

    var result = await getLaunches(_paginationModel);

    result.fold((l) {
      emit(Error());
    }, (r) {
      emit(Loaded(r));
    });
  }

  loadMore() async {
    var result = await getLaunches(_paginationModel);
    print(result);

    result.fold((l) {
      emit(Error());
    }, (r) {
      (state as Loaded).listOfLaunches.addAll(r);
      emit((state as Loaded).copyWith(state as Loaded));
    });
  }
}
