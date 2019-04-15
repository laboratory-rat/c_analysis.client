import 'package:json_annotation/json_annotation.dart';
import '../tools/datetime.dart';

part 'timerange.g.dart';

@JsonSerializable()
class TimeRange {
  @JsonKey(fromJson: timeFromJson, toJson: timeToJson)
  DateTime from;

  @JsonKey(fromJson: timeFromJson, toJson: timeToJson)
  DateTime until;

  TimeRange();

  factory TimeRange.fromJson(Map<String, dynamic> json) =>
      _$TimeRangeFromJson(json);
  Map<String, dynamic> toJson() => _$TimeRangeToJson(this);
}
