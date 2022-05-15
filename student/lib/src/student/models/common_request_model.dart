
import 'package:json_annotation/json_annotation.dart';
import 'package:student/src/student/models/student_model.dart';
part 'common_request_model.g.dart';

@JsonSerializable()
class CommonRequestModel{
  CommonRequestModel();
  @JsonKey(name : "body")
  StudentModel body = StudentModel();

  factory CommonRequestModel.fromJson(Map<String, dynamic> json) => _$CommonRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$CommonRequestModelToJson(this);

  @override
  String toString() {
    return 'CommonRequestModel{body: $body,}';
  }

//  BusinessModel get body => _businessModel;
}