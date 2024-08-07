final class DurationFormatter {
  static String formatMmSs(Duration duration) {
    final mm = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final ss = (duration.inSeconds % 60).toString().padLeft(2, '0');

    return '$mm:$ss';
  }

  static String formatHhMm(Duration duration) {
    final hh = (duration.inHours % 60).toString().padLeft(2, '0');
    final mm = (duration.inMinutes % 60).toString().padLeft(2, '0');

    return '$hh:$mm';
  }
}
