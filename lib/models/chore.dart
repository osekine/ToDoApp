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

List<Chore> dumbell = [
  Chore(name: 'Купить гирю'),
  Chore(name: 'Купить гирю'),
  Chore(name: 'Купить гирю'),
  Chore(name: 'Купить большую гирю', priority: Priority.high),
  Chore(name: 'Купил гирю', isDone: true),
  Chore(name: 'Купить маленькую гирю', priority: Priority.low),
  Chore(name: 'Купить гирю'),
  Chore(name: 'Купить гирю'),
  Chore(name: 'Купить гирю'),
  Chore(name: 'Купить гирю'),
  Chore(name: 'Купить гирю'),
  Chore(name: 'Купить гирю'),
  Chore(name: 'Купить гирю'),
  Chore(name: 'Купить гирю'),
  Chore(name: 'Купить гирю'),
];
