// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chore.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chore _$ChoreFromJson(Map<String, dynamic> json) => Chore(
      name: json['name'] as String,
      deadline: json['deadline'] == null
          ? null
          : DateTime.parse(json['deadline'] as String),
      isDone: json['isDone'] as bool? ?? false,
      priority: $enumDecodeNullable(_$PriorityEnumMap, json['priority']) ??
          Priority.none,
    )
      ..chagedAt = (json['change_at'] as num).toInt()
      ..id = (json['id'] as num).toInt();

Map<String, dynamic> _$ChoreToJson(Chore instance) => <String, dynamic>{
      'name': instance.name,
      'deadline': instance.deadline?.toIso8601String(),
      'isDone': instance.isDone,
      'priority': _$PriorityEnumMap[instance.priority]!,
      'change_at': instance.chagedAt,
      'id': instance.id,
    };

const _$PriorityEnumMap = {
  Priority.none: 'basic',
  Priority.low: 'low',
  Priority.high: 'important',
};
