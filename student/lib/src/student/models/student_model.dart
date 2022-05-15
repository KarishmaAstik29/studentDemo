import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
part 'student_model.g.dart';

@JsonSerializable()
class StudentModel{
 
  StudentModel();
  @JsonKey(name : "id")
  int? id;
  @JsonKey(name : "name")
  String name = "";
  @JsonKey(name : "age")
  int? age;

  factory StudentModel.fromJson(Map<String, dynamic> json) => _$StudentModelFromJson(json);
  Map<String, dynamic> toJson() => _$StudentModelToJson(this);

  static StudentModel clone(StudentModel toBeCloned){
    final String jsonString = json.encode(toBeCloned);
    final jsonResponse = json.decode(jsonString);
    return StudentModel.fromJson(jsonResponse as Map<String, dynamic>);
  }

  @override
  String toString() {
    return 'StudentModel{id: $id,name: $name,age: $age}';
  }
}



















  // static StudentModel clone(StudentModel toBeCloned){
  //   final String jsonString = json.encode(toBeCloned);
  //   final jsonResponse = json.decode(jsonString);
  //   return StudentModel.fromJson(jsonResponse as Map<String, dynamic>);
  // }