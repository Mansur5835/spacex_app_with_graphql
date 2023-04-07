part of 'ql_repository.dart';

class _QlRepository implements QlRepository {
  late final GraphQLClient client;

  _QlRepository(this.client);

  @override
  Future<List<LauchModel>?> getLaunches(
      {required int limit, required int offset}) async {
    QueryResult queryResult;
    try {
      queryResult = await client.query(QueryOptions(
          fetchPolicy: FetchPolicy.networkOnly,
          document: gql(
            QlConst.launchesQuery,
          ),
          variables: {"limit": limit, "offset": offset}));
    } catch (e) {
      return null;
    }

    List? _listData = queryResult.data?["launches"];

    List<LauchModel> launches =
        _listData?.map((e) => LauchModel.fromJson(e)).toList() ?? [];

    return launches;
  }

  @override
  Future<LauchModel?> getLauncheById({required String launchId}) async {
    QueryResult queryResult;
    try {
      queryResult = await client.query(QueryOptions(
          fetchPolicy: FetchPolicy.networkOnly,
          document: gql(
            QlConst.launcheByIdQuery,
          ),
          variables: {"launchId": launchId}));
    } catch (e) {
      return null;
    }

    LauchModel? lauchModel =
        LauchModel.fromJson(queryResult.data?["launch"] ?? {});
    return lauchModel;
  }
}
