import 'dart:math';
import 'package:znews/model/source.dart';
class SourceResponse{
  final List<SourceModle> category ;
  final String error;
  SourceResponse(this.category,this.error);
  SourceResponse.fromJson(Map<String,dynamic>  json)
      :category=(json["category"] as List).map((e) => SourceModle.fromJson(e)).toList(),
        error="";
  SourceResponse.withError(String errorValue)
      :category =[],
        error =errorValue;}