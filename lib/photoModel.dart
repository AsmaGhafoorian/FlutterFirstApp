
import 'package:json_annotation/json_annotation.dart';

part 'photoModel.g.dart';

@JsonSerializable()
class PhotoModel{
  final int albumId;
  final int id;
  final String title;
  final String url;
  @JsonKey(name: 'thumbnailUrl') // rename property server name
  final String thumbnailurl;

  PhotoModel({this.albumId, this.id, this.title, this.url, this.thumbnailurl});

  factory PhotoModel.fromJson(Map<String, dynamic> json) => _$PhotoModelFromJson(json);
  Map<String, dynamic> toJson() => _$PhotoModelToJson(this);

}