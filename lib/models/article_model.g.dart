// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleModel _$ArticleModelFromJson(Map<String, dynamic> json) => ArticleModel(
  userId: json['userId'] as String,
  title: json['title'] as String,
  likes: json['likes'] as String,
  id: json['id'] as String?,
);

Map<String, dynamic> _$ArticleModelToJson(ArticleModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'title': instance.title,
      'likes': instance.likes,
      'id': instance.id,
    };
