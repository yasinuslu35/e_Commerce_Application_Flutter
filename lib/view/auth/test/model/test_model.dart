import 'package:e_commerce_application/core/base/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'test_model.g.dart';

@JsonSerializable()
class TestModel extends BaseModel{
  int? userId;
  int? id;
  String? title;
  bool? completed;

  TestModel({this.userId, this.id, this.title, this.completed});

  @override
  Map<String, dynamic> toJson() {
    return _$TestModelToJson(this);
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return _$TestModelFromJson(json);

  }
}
