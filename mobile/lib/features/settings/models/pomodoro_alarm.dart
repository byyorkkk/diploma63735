import 'package:adhd_project/gen/assets.gen.dart';

enum PomodoroAlarm {
  attention(0),
  cuckoo(1),
  digital(2),
  kitchen(3),
  levelUp(4),
  meditation(5);

  const PomodoroAlarm(this.id);

  final int id;

  String get path => switch (this) {
        attention => Assets.alarms.attention,
        cuckoo => Assets.alarms.cuckoo,
        digital => Assets.alarms.digital,
        kitchen => Assets.alarms.kitchen,
        levelUp => Assets.alarms.levelUp,
        meditation => Assets.alarms.meditation,
      };

  static PomodoroAlarm fromId(int id) => PomodoroAlarm.values.firstWhere(
        (e) => e.id == id,
      );
}
