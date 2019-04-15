// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timerange.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeRange _$TimeRangeFromJson(Map<String, dynamic> json) {
  return TimeRange()
    ..from = json['from'] == null ? null : timeFromJson(json['from'] as String)
    ..until =
        json['until'] == null ? null : timeFromJson(json['until'] as String);
}

Map<String, dynamic> _$TimeRangeToJson(TimeRange instance) => <String, dynamic>{
      'from': instance.from == null ? null : timeToJson(instance.from),
      'until': instance.until == null ? null : timeToJson(instance.until)
    };
