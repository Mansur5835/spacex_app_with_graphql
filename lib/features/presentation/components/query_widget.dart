import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

// ignore: must_be_immutable
class QueryWidget extends StatelessWidget {
  QueryWidget(
      {super.key, this.variables, required this.builder, required this.doc});

  Map<String, dynamic>? variables;
  String doc;

  Widget Function(Map? data, {VoidCallback? refetch, FetchMore? fetchMore})
      builder;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Query(
        options: QueryOptions(
          onError: (error) {},
          document: gql(doc),
          variables: variables ?? {},
        ),
        builder: (QueryResult result,
            {VoidCallback? refetch, FetchMore? fetchMore}) {
          if (result.isLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: theme.primaryColor,
              ),
            );
          }
          return builder(result.data, refetch: refetch, fetchMore: fetchMore);
        });
  }
}
