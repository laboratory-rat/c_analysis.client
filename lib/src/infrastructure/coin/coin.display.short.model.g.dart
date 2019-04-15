// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin.display.short.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinDisplayShortModel _$CoinDisplayShortModelFromJson(
    Map<String, dynamic> json) {
  return CoinDisplayShortModel()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..symbol = json['symbol'] as String
    ..full_name = json['full_name'] as String
    ..url = json['url'] as String
    ..image_url = json['image_url'] as String;
}

Map<String, dynamic> _$CoinDisplayShortModelToJson(
        CoinDisplayShortModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
      'full_name': instance.full_name,
      'url': instance.url,
      'image_url': instance.image_url
    };
