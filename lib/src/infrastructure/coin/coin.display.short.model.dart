import 'package:json_annotation/json_annotation.dart';

part 'coin.display.short.model.g.dart';

@JsonSerializable()
class CoinDisplayShortModel {
  String id;
  String name;
  String symbol;
  String full_name;
  String url;
  String image_url;

  CoinDisplayShortModel();

  factory CoinDisplayShortModel.fromJson(Map<String, dynamic> json) =>
      _$CoinDisplayShortModelFromJson(json);
  Map<String, dynamic> toJson() => _$CoinDisplayShortModelToJson(this);
}
