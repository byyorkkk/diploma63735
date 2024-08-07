enum TaskStatus {
  notStarted(0),
  inProgress(1),
  done(2);

  const TaskStatus(this.backendEnumValue);

  static TaskStatus fromValue(int value) => TaskStatus.values.firstWhere(
        (e) => e.backendEnumValue == value,
      );
  final int backendEnumValue;

  String tr() => switch (this) {
        notStarted => 'Not started',
        inProgress => 'In progress',
        done => 'Done',
      };
}
