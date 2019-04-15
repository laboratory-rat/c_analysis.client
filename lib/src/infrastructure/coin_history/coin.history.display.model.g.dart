// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin.history.display.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinHistoryDisplayModel _$CoinHistoryDisplayModelFromJson(
    Map<String, dynamic> json) {
  return CoinHistoryDisplayModel()
    ..primary_label = json['primary_label'] as String
    ..accent_label = json['accent_label'] as String
    ..units = json['units'] == null
        ? null
        : unitsFromJson(json['units'] as List<Map<String, dynamic>>);
}

Map<String, dynamic> _$CoinHistoryDisplayModelToJson(
        CoinHistoryDisplayModel instance) =>
    <String, dynamic>{
      'primary_label': instance.primary_label,
      'accent_label': instance.accent_label,
      'units': instance.units == null ? null : unitsToJson(instance.units)
    };

CoinHistoryUnitDisplayModel _$CoinHistoryUnitDisplayModelFromJson(
    Map<String, dynamic> json) {
  return CoinHistoryUnitDisplayModel()
    ..type = json['type'] as String
    ..time_object = json['time_object'] == null
        ? null
        : timeFromJson(json['time_object'] as String)
    ..open = json['open'] as num
    ..close = json['close'] as num
    ..hight = json['hight'] as num
    ..low = json['low'] as num
    ..volume_from = json['volume_from'] as num
    ..volume_to = json['volume_to'] as num;
}

Map<String, dynamic> _$CoinHistoryUnitDisplayModelToJson(
        CoinHistoryUnitDisplayModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'time_object': instance.time_object == null
          ? null
          : timeToJson(instance.time_object),
      'open': instance.open,
      'close': instance.close,
      'hight': instance.hight,
      'low': instance.low,
      'volume_from': instance.volume_from,
      'volume_to': instance.volume_to
    };
