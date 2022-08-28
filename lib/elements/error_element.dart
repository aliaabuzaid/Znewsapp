import 'package:flutter/cupertino.dart';
Widget buildErrorWidget (String error){
  return Container(
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
    Center(
      child: Text("خطأ...الرجاء التاكد من الاتصال بالانترنت ",
      style: TextStyle(fontSize:12.0 ,fontWeight: FontWeight.bold),
  ),
    ),
  ],
  ),
  );
  }