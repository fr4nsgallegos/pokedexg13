import 'package:json_annotation/json_annotation.dart';

part 'article_model.g.dart'; //esto es lo que se va a generar

@JsonSerializable()
class ArticleModel {
  String userId;
  String title;
  String likes;
  String id;

  ArticleModel({
    required this.userId,
    required this.title,
    required this.likes,
    required this.id,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
    userId: json["user_id"],
    title: json["title"],
    likes: json["likes"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "title": title,
    "likes": likes,
    "id": id,
  };
}
