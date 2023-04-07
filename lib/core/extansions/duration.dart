extension DurationValue on int {
  Duration get onDur {
    return Duration(milliseconds: this);
  }
}
