// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonRequestModel _$CommonRequestModelFromJson(Map<String, dynamic> json) =>
    CommonRequestModel()
      ..body = StudentModel.fromJson(json['body'] as Map<String, dynamic>);

Map<String, dynamic> _$CommonRequestModelToJson(CommonRequestModel instance) =>
    <String, dynamic>{
      'body': instance.body,
    };
