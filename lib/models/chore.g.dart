// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chore.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chore _$ChoreFromJson(Map<String, dynamic> json) => Chore(
      name: json['text'] as String,
      deadline: json['deadline'] == null
          ? null
          : DateTime.parse(json['deadline'] as String),
      isDone: json['done'] as bool? ?? false,
      priority: $enumDecodeNullable(_$PriorityEnumMap, json['importance']) ??
          Priority.none,
      id: (json['id'] as num?)?.toInt(),
      chagedAt: (json['changed_at'] as num?)?.toInt(),
      createdAt: (json['created_at'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ChoreToJson(Chore instance) => <String, dynamic>{
      'text': instance.name,
      'deadline': instance.deadline?.toIso8601String(),
      'done': instance.isDone,
      'importance': _$PriorityEnumMap[instance.priority]!,
      'created_at': instance.createdAt,
      'changed_at': instance.chagedAt,
      'id': instance.id,
    };

const _$PriorityEnumMap = {
  Priority.none: 'basic',
  Priority.low: 'low',
  Priority.high: 'important',
};
