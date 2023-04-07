import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:logger/logger.dart' show Logger;

import '../../features/data/constants/ql_const.dart';

HttpLink _link = HttpLink(QlConst.url);
final _logger = Logger();

ValueNotifier<GraphQLClient> qlClient = ValueNotifier(GraphQLClient(
  link: _link,
  cache: GraphQLCache(
      store: InMemoryStore(),
      dataIdFromObject: (object) {
        // _logger.i(object);
      }),
));
