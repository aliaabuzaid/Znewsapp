import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:znews/elements/loader.dart';
import 'package:znews/model/sudanarticles.dart';
import 'package:znews/model/source_response.dart';
import 'package:znews/style/theme.dart' as style;
import 'package:znews/sudan_news/sudani.dart';
//import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'dart:convert';
import '../category_detail.dart';
class SourceScreen extends StatefulWidget {
  const SourceScreen({Key? key}) : super(key: key);
  @override
  _SourceScreenState createState() => _SourceScreenState();}
  class _SourceScreenState extends State<SourceScreen> {

  @override
  Widget build(BuildContext context) {
  String url= 'https://www.sudanakhbar.com/sudan-news';
  String SportUrl='https://www.sudanakhbar.com/sports' ;
  String EcnomicUrl='https://www.sudanakhbar.com/business-news';
  return DefaultTabController(length: 3,
  initialIndex: 1,
  child: Scaffold(
  appBar: AppBar(
  backgroundColor:style.Colors.mainColor,
  toolbarHeight: 15,
  //20 title: Text(""),
  bottom: const TabBar(
  indicatorColor:style.Colors.secondColor,
  indicatorWeight: 5.0,
  labelColor: Colors.white,
  unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w100,fontSize:18 ),
  labelStyle: TextStyle(fontWeight: FontWeight.bold,fontSize:20  ),
  labelPadding: EdgeInsets.only(top: 10.0),
  unselectedLabelColor: Colors.grey,
  tabs: [
  Tab(text:("الرياضه")),
  Tab(text:("الأخبار")),
  Tab(text:("الإقتصاد")),
  ],
  ),
  ),
  body: TabBarView(
  children: [
  Center(
  child:  Post(url: SportUrl,),
  ),
  Center(
  child:  Post(url: url,),
  ),
  Center(
  child:  Post(url:EcnomicUrl,),
  ),
  ],
  ),
  ));
  }}


