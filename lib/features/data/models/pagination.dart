class PaginationModel {
  int _limit = 0;
  int _offset = -10;

  int get offset {
    _offset = _offset + 10;

    return _offset;
  }

  int get limit {
    _limit = _limit + 10;

    return _limit;
  }

  void back() {
    _offset = 0;
    _limit = -10;
  }
}
