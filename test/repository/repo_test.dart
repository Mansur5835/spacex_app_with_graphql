import 'package:flutter_test/flutter_test.dart';
import 'package:spacex_grathql_app/features/domein/repository/ql_repository.dart';

void main() {
  late QlRepository qlRepository;

  setUp(() {
    qlRepository = QlRepository();
  });

  group('pagination limit == 10', () {
    test("pagination checking 1", () async {
      expect(
          await qlRepository
              .getLaunches(limit: 10, offset: 0)
              .then((value) => value?.length),
          10);
    });

    test("pagination checking 2", () async {
      expect(
          await qlRepository
              .getLaunches(limit: 20, offset: 10)
              .then((value) => value?.length),
          10);
    });

    test("pagination checking 3", () async {
      expect(
          await qlRepository
              .getLaunches(limit: 30, offset: 20)
              .then((value) => value?.length),
          10);
    });
  });

  group("range error", () {
    String id1 = "5eb87cdbffd86e000604b32c";
    String id2 = "5eb87ce2ffd86e000604b335";
    String id3 = "5eb87ce1ffd86e000604b333";

    test("range error 1", () async {
      var launch1 = await qlRepository.getLauncheById(launchId: id1);

      expect((launch1?.launchDateLocal?.length ?? 0) >= 10, true);
    });

    test("range error 2", () async {
      var launch2 = await qlRepository.getLauncheById(launchId: id2);

      expect((launch2?.launchDateLocal?.length ?? 0) >= 10, true);
    });

    test("range error 3", () async {
      var launch3 = await qlRepository.getLauncheById(launchId: id3);

      expect((launch3?.launchDateLocal?.length ?? 0) >= 10, true);
    });
  });
}
