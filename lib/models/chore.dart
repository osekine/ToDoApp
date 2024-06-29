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
    String? id,
    int? chagedAt,
    int? createdAt,
    String? deviceId,
  })  : deviceId = deviceId ?? 'leZaglushka',
        id = id ?? UniqueKey().toString(),
        chagedAt = chagedAt ?? DateTime.now().microsecondsSinceEpoch,
        createdAt = createdAt ?? DateTime.now().microsecondsSinceEpoch;

  @JsonKey(name: 'text')
  String name;

  final DateTime? deadline;

  @JsonKey(name: 'done')
  bool isDone;

  @JsonKey(name: 'importance')
  final Priority priority;

  @JsonKey(name: 'created_at')
  final int createdAt;

  @JsonKey(name: 'changed_at')
  int chagedAt;

  final String id;

  @JsonKey(name: 'last_updated_by')
  final String deviceId;

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
  int get hashCode => id.hashCode;
}

// List<Chore> dumbell = [
//   Chore(
//     name: 'Купить гирю',
//     isDone: true,
//     priority: Priority.high,
//   ),
//   Chore(name: 'Купить гирю'),
//   Chore(name: 'Купить гирю'),
//   Chore(name: 'Купить большую гирю', priority: Priority.high),
//   Chore(name: 'Купил гирю', isDone: true),
//   Chore(name: 'Купить маленькую гирю', priority: Priority.low),
//   Chore(name: 'Купить гирю'),
//   Chore(name: 'Купить гирю'),
//   Chore(name: 'Купить гирю'),
//   Chore(name: 'Купить гирю', isDone: true),
//   Chore(
//     priority: Priority.low,
//     name:
//         'Мне пора прекратить покупать гири, но я не могу остановиться. Мне кажется, у меня есть проблемы',
//   ),
//   Chore(name: 'Купить гирю', isDone: true),
//   Chore(name: 'Купить гирю'),
//   Chore(name: 'Купить гирю'),
//   Chore(name: 'Купить гирю'),
// ];
