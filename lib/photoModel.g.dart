// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photoModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoModel _$PhotoModelFromJson(Map<String, dynamic> json) {
  return PhotoModel(
    albumId: json['albumId'] as int,
    id: json['id'] as int,
    title: json['title'] as String,
    url: json['url'] as String,
    thumbnailurl: json['thumbnailUrl'] as String,
  );
}

Map<String, dynamic> _$PhotoModelToJson(PhotoModel instance) =>
    <String, dynamic>{
      'albumId': instance.albumId,
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailurl,
    };
