import 'package:json_annotation/json_annotation.dart';
import '../tools/datetime.dart';

part 'coin.history.display.model.g.dart';

@JsonSerializable()
class CoinHistoryDisplayModel {
  String primary_label;
  String accent_label;

  @JsonKey(fromJson: unitsFromJson, toJson: unitsToJson)
  List<CoinHistoryUnitDisplayModel> units;

  CoinHistoryDisplayModel();

  factory CoinHistoryDisplayModel.fromJson(Map<String, dynamic> json) =>
      _$CoinHistoryDisplayModelFromJson(json);
  Map<String, dynamic> toJson() => _$CoinHistoryDisplayModelToJson(this);
}

@JsonSerializable()
class CoinHistoryUnitDisplayModel {
  String type;

  @JsonKey(fromJson: timeFromJson, toJson: timeToJson)
  DateTime time_object;

  num open;
  num close;
  num hight;
  num low;
  num volume_from;
  num volume_to;

  CoinHistoryUnitDisplayModel();

  factory CoinHistoryUnitDisplayModel.fromJson(Map<String, dynamic> json) =>
      _$CoinHistoryUnitDisplayModelFromJson(json);
  Map<String, dynamic> toJson() => _$CoinHistoryUnitDisplayModelToJson(this);
}

List<Map<String, dynamic>> unitsToJson(
        List<CoinHistoryUnitDisplayModel> model) =>
    model.map((x) => x.toJson()).toList();
List<CoinHistoryUnitDisplayModel> unitsFromJson(
        List<Map<String, dynamic>> list) =>
    list.map((x) => CoinHistoryUnitDisplayModel.fromJson(x)).toList();
