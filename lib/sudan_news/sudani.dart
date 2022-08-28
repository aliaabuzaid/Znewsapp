import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';
import 'package:znews/style/theme.dart' as Style;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart' ;
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart' ;
import 'package:znews/widgets/webview.dart';
class Post extends StatefulWidget {
  final String url ;
  Post({Key? key, required this.url}) : super(key: key);
  @override
  _PostState createState() => _PostState(url);}
  class _PostState extends State<Post> {
  final String url;
  _PostState(this.url);
  List<String> title = [];
  List<String> source = [];
  List<String> time = [];
  List<String?> link = [];
  List<String?> image = [];
  bool isloading = false;
  // var uri =Uri.parse('https://www.sudanakhbar.com/sudan-news');
//  String zUrl=url;
  void getDataFromWeb(Uri uri) async {
  setState(() {
  isloading = true;
  });
  final response = await http.get(uri);
  dom.Document document = parser.parse(response.body);
  final element = await document.getElementsByClassName("entry-title");
  final elementtitle = await document.getElementsByClassName("entry-header");
  title =
  elementtitle.map((e) => e.getElementsByClassName("entry-title")[0].text).toList();
  link = element.map((e) => e.getElementsByTagName("a")[0].attributes['href'])
      .toList();
  final co = document.getElementsByClassName("fn");
  source = co.map((e) => e.getElementsByTagName("a")[0].innerHtml).toList();
  final timeelement = document.getElementsByClassName("entry-meta");
  time = timeelement.map((e) => e.getElementsByClassName("meta-item date")[0]
      .text).toList();
  final im = document.getElementsByClassName("meta-image");
  image = im.map((e) => e.getElementsByTagName("img")[0].attributes['src'])
      .toList();
  print("l" + link.toString());
  print("lt" + title.toString());

  setState(() {
  isloading = false;
  });
  }
  @override
  void initState() {
  var uri = Uri.parse(url);
  getDataFromWeb(uri);
  }
  @override
  Widget build(BuildContext context) {
  print(isloading.toString());
  if(isloading==true){
  print( "Shimmer");
  return  Shimmer.fromColors(baseColor: Colors.grey[300]!, highlightColor:Colors.grey[100]!, child:
  ListView.builder(
  itemCount:5,
  itemBuilder: (context, index) {
  return _buildShimmerWidget();}) );
  }
  else{
  return ListView.builder(
  itemCount: title.length,
  itemBuilder: (context, index) {
  var Height = 150.0;
  //  var Height= title.length/2*210.0;
  return GestureDetector(
  onTap: () async {
  dynamic url = link[index]!;

  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (context) =>  webviews( url: url,
  )));
  },
  child: Container(
  decoration: BoxDecoration(
  border: Border(top: BorderSide(color: Colors.grey,
  width: 1.0)),
  color: Colors.white,
  ),
  height: Height,
  child: Row(
  children: <Widget>[
  Container(
  padding: EdgeInsets.only(
  top: 10.0, left: 10.0, bottom: 10, right: 10.0
  ),
  width: MediaQuery
      .of(context)
      .size
      .width * 3 / 5,
  child: Column(
  mainAxisAlignment: MainAxisAlignment.end,
  crossAxisAlignment: CrossAxisAlignment.end,
  children: <Widget>[
  Container(
  height: 79,
  //   color: Colors.amber,
  alignment: Alignment.centerRight,
  child: Text(title[index],
  maxLines: 3,
  textAlign: TextAlign.right,
  style: const TextStyle(
  fontWeight: FontWeight.bold,
  //     color: Colors.black,
  fontSize: 14.0,
  ),),
  ),
  Container(
  height: 25,
  //color: Colors.black38,
  alignment: Alignment.bottomRight,
  child: Text("أخبارالسودان${source[index]}",
  textAlign: TextAlign.right,
  style: const TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 10.0,
  ),),
  ),
  Container(
  height: 25,
  //   color: Colors.blue,
  alignment: Alignment.bottomLeft,
  child: Text(time[index],
  textAlign: TextAlign.left,
  style: const TextStyle(
  color: Colors.black26,
  fontWeight: FontWeight.bold,
  fontSize: 10.0
  ),),),
  ],
  ),
  ),
  Container(
  padding: EdgeInsets.only(right: 10.0),
  width: MediaQuery
      .of(context)
      .size
      .width * 2 / 5,
  height: 130,
  child: FadeInImage.assetNetwork(
  placeholder: 'assets/img/placeholder.jpg',
  image: image[index]! == null
  ? "http://to-let.com.bd/operator/images/noimage.png"
      : image[index]!,
  fit: BoxFit.fitHeight,
  width: double.maxFinite,
  height: MediaQuery
      .of(context)
      .size
      .height * 1 / 3,),
  ),
  ],),
  ),
  );
  });}
  }
  Widget _buildShimmerWidget() {
  return Row(
  children: <Widget>[
  Container(
  //  padding: const EdgeInsets.all(8.0),
  width: MediaQuery
      .of(context)
      .size
      .width * 2.8 / 5,
  height: 130,
  child: Column(
  mainAxisAlignment: MainAxisAlignment.end,
  crossAxisAlignment: CrossAxisAlignment.end,
  children: <Widget>[
  Padding(
  padding: const EdgeInsets.all(8.0),
  child: Container(
  height: 35,
  //   color: Colors.amber,
  color: Colors.white,
  alignment: Alignment.centerRight,
  ),
  ),
  Padding(
  padding: const EdgeInsets.all(8.0),
  child: Container(
  height: 20,
  width: MediaQuery
      .of(context)
      .size
      .width * 1.5 / 5,
  color: Colors.white,
  alignment: Alignment.bottomRight,
  ),
  ),
  Padding(
  padding: const EdgeInsets.all(8.0),
  child: Container(
  height: 10,
  width: MediaQuery
      .of(context)
      .size
      .width * 1 / 5,
  color: Colors.blue,
  alignment: Alignment.bottomLeft,
  ),
  ),
  ],
  ),
  ),
  Container(
  padding: const EdgeInsets.all(8.0),
  width: MediaQuery
      .of(context)
      .size
      .width * 2 / 5,
  height: 120,
  color: Colors.white,
  ),
  ],);
  }
  }
