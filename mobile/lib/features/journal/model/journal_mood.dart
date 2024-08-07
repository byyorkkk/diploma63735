enum JournalMood {
  angry(1),
  sad(0),
  disappointed(4),
  normal(3),
  happy(2);

  const JournalMood(this.backendEnumValue);

  static JournalMood fromValue(int value) => JournalMood.values.firstWhere(
        (e) => e.backendEnumValue == value,
      );
  final int backendEnumValue;

  String tr() => switch (this) {
        angry => 'Angry',
        sad => 'Sad',
        disappointed => 'Disappointed',
        normal => 'Neutral',
        happy => 'Happy',
      };
}
