import 'package:json_annotation/json_annotation.dart';
import '../tools/datetime.dart';

part 'coin.history.search.model.g.dart';

@JsonSerializable()
class CoinHistorySearchModel {
  String primary;
  String accent;

  @JsonKey(fromJson: timeFromJson, toJson: timeToJson)
  DateTime from;

  @JsonKey(fromJson: timeFromJson, toJson: timeToJson)
  DateTime until;

  String type;
  String resulution;

  CoinHistorySearchModel();

  factory CoinHistorySearchModel.fromJson(Map<String, dynamic> json) =>
      _$CoinHistorySearchModelFromJson(json);
  Map<String, dynamic> toJson() => _$CoinHistorySearchModelToJson(this);
}
