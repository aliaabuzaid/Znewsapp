import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:znews/model/article.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:znews/style/theme.dart' as style ;
import 'package:znews/widgets/webview.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../elements/loader.dart';
class DetailNews extends StatefulWidget {
  final ArticleModle article;
  DetailNews({Key? key, required this.article}) : super(key: key);
  @override
  _DetailNewsState createState() => _DetailNewsState(article);}
  class _DetailNewsState extends State<DetailNews> {
  final ArticleModle article;

  _DetailNewsState(this.article);
  @override
  Widget build(BuildContext context) {

    if( article.description.length>0){
  return Scaffold(
  bottomNavigationBar: GestureDetector(
  onTap: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (context) =>  webviews( url: article.url,
  )));
  },
  child: Container(
  height: 48.0,
  width: MediaQuery.of(context).size.width,
  decoration: const BoxDecoration(
  color: Colors.white,
  gradient: style.Colors.primaryGradien
  ),
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: <Widget>[
  Text("قراءه المزيد...", style: TextStyle(
  color: Colors.white,
  fontFamily: "SFPro-Bold",
  fontSize: 15.0
  ),),
  ],
  ),
  ),
  ),
  appBar: AppBar(
  elevation: 0.0,
  backgroundColor: style.Colors.mainColor,
  title: new Text(
  article.title,
  textAlign: TextAlign.right,
  style: TextStyle(
  fontSize: Theme.of(context).platform == TargetPlatform.iOS
  ? 17.0
      : 17.0,
  color: Colors.white,
  fontWeight: FontWeight.bold),
  ),
  ),
  body: ListView(
  children: <Widget>[
  AspectRatio(
  aspectRatio: 16/9,
  child:CachedNetworkImage(
    imageUrl:  article.img,
    placeholder: (context, url) => buildLoadingWidget(),
    errorWidget: (context, url, error) => Image.asset('assets/img/placeholder.jpg'),
      fit: BoxFit.cover,
      width: double.maxFinite,
      height:  MediaQuery.of(context).size.height*1/3
  ),
 /* FadeInImage.assetNetwork(
  alignment: Alignment.topCenter,
  fadeInCurve: Curves.bounceIn,
  placeholder: 'assets/img/placeholder.jpg',
  image: article.img,
  fit: BoxFit.cover,
  width: double.maxFinite,
  height:  MediaQuery.of(context).size.height*1/3
  ),*/
  ),
  Container(
  padding: EdgeInsets.all(10.0),
  child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
  SizedBox(
  height: 10.0,
  ),
  Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: <Widget>[
  Text(article.data.substring(0, 10), style: TextStyle(
  color: style.Colors.secondColor,
  fontWeight: FontWeight.bold
  )),
  ],
  ),
  SizedBox(
  height: 10.0,
  ),
  GestureDetector(
  onTap: () {
  },
  child: Text(
  article.title,
  textAlign: TextAlign.right,
  style: TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.black,
  fontSize: 20.0)),
  ),
  SizedBox(
  height: 10.0,
  ),
  Text(timeUntil(DateTime.parse(article.data)), style: TextStyle(
  color: style.Colors.secondColor,
  fontSize: 12.0
  ),),
  SizedBox(
  height: 5.0,
  ),
  Html(
  data: article.description,
  style: {'html': Style(textAlign: TextAlign.right,)},

  ),
  ],
  ),
  )
  ],
  ),
  );}
    else{return Center(child: CircularProgressIndicator());}
  }
  String timeUntil(DateTime date) {
  return timeago.format(date, allowFromNow: true);
  }}

