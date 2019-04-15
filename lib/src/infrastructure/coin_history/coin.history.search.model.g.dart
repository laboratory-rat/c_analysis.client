// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin.history.search.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinHistorySearchModel _$CoinHistorySearchModelFromJson(
    Map<String, dynamic> json) {
  return CoinHistorySearchModel()
    ..primary = json['primary'] as String
    ..accent = json['accent'] as String
    ..from = json['from'] == null ? null : timeFromJson(json['from'] as String)
    ..until =
        json['until'] == null ? null : timeFromJson(json['until'] as String)
    ..type = json['type'] as String
    ..resulution = json['resulution'] as String;
}

Map<String, dynamic> _$CoinHistorySearchModelToJson(
        CoinHistorySearchModel instance) =>
    <String, dynamic>{
      'primary': instance.primary,
      'accent': instance.accent,
      'from': instance.from == null ? null : timeToJson(instance.from),
      'until': instance.until == null ? null : timeToJson(instance.until),
      'type': instance.type,
      'resulution': instance.resulution
    };
