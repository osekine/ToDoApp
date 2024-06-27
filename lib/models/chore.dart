import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chore.g.dart';

enum Priority {
  @JsonValue('basic')
  none,
  @JsonValue('low')
  low,
  @JsonValue('important')
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

@JsonSerializable()
class Chore {
  Chore({
    required this.name,
    this.deadline,
    this.isDone = false,
    this.priority = Priority.none,
  }) {
    chagedAt = createdAt;
    id = UniqueKey().hashCode;
  }

  String name;
  final DateTime? deadline;
  final bool isDone;
  final Priority priority;
  final createdAt = DateTime.now().microsecondsSinceEpoch;
  @JsonKey(name: 'change_at')
  late int chagedAt;
  late final int id;

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

  factory Chore.fromJson(Map<String, dynamic> json) => _$ChoreFromJson(json);

  Map<String, dynamic> toJson() => _$ChoreToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Chore && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id;
}

List<Chore> dumbell = [
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
