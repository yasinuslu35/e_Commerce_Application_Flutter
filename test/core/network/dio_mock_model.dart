import 'package:e_commerce_application/core/base/model/base_model.dart';

class PostModel extends BaseModel<PostModel> {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostModel({this.userId, this.id, this.title, this.body});

  PostModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'] as int?;
    id = json['id'] as int?;
    title = json['title'] as String?;
    body = json['body'] as String?;
  }

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }

  @override
  PostModel fromJson(Map<String, dynamic> json) {
    return PostModel.fromJson(json);
  }
}