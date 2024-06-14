enum Priority { none, low, high }

class Chore {
  String name;
  DateTime? deadline;
  bool isDone = false;
  Priority priority = Priority.none;

  Chore(
      {required this.name,
      this.deadline,
      this.isDone = false,
      this.priority = Priority.none});
}
