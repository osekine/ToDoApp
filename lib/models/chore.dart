enum Priority {
  none,
  low,
  high;

  String get name {
    switch (this) {
      case Priority.none:
        return 'Нет';
      case Priority.low:
        return 'Низкая';
      case Priority.high:
        return 'Высокая';
    }
  }
}

class Chore {
  final String name;
  final DateTime? deadline;
  final bool isDone;
  final Priority priority;

  const Chore({
    required this.name,
    this.deadline,
    this.isDone = false,
    this.priority = Priority.none,
  });

  Chore copyWith({
    String? name,
    DateTime? deadline,
    bool? isDone,
    Priority? priority,
  }) {
    return Chore(
      name: name ?? this.name,
      deadline: deadline ?? this.deadline,
      isDone: isDone ?? this.isDone,
      priority: priority ?? this.priority,
    );
  }
}

List<Chore> dumbell = const [
  Chore(
    name: 'Купить гирю',
    isDone: true,
    priority: Priority.high,
  ),
  Chore(name: 'Купить гирю'),
  Chore(name: 'Купить гирю'),
  Chore(name: 'Купить большую гирю', priority: Priority.high),
  Chore(name: 'Купил гирю', isDone: true),
  Chore(name: 'Купить маленькую гирю', priority: Priority.low),
  Chore(name: 'Купить гирю'),
  Chore(name: 'Купить гирю'),
  Chore(name: 'Купить гирю'),
  Chore(name: 'Купить гирю', isDone: true),
  Chore(
    priority: Priority.low,
    name:
        'Мне пора прекратить покупать гири, но я не могу остановиться. Мне кажется, у меня есть проблемы',
  ),
  Chore(name: 'Купить гирю', isDone: true),
  Chore(name: 'Купить гирю'),
  Chore(name: 'Купить гирю'),
  Chore(name: 'Купить гирю'),
];
