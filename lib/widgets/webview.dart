import 'dart:async';
import 'package:znews/elements/error_element.dart';
import 'package:znews/style/theme.dart' as Style;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
class webviews extends StatefulWidget {
  final String url;
  webviews({Key? key, required this.url}) : super(key: key);
  @override
  _webviewsState createState() => _webviewsState(url);}
  class _webviewsState extends State<webviews> {
  final String url;
  _webviewsState(this.url);
  Completer <WebViewController> _controller = Completer<WebViewController>();
  final GlobalKey<ScaffoldState> _scoffoldkey = GlobalKey<ScaffoldState>();
  bool isloading = true;
  final key = UniqueKey();
  @override
  Widget build(BuildContext context) {
  //MaterialApp(
  //
  //       home:
  return Scaffold(
  key: _scoffoldkey,
  appBar:AppBar(
  backgroundColor: Style.Colors.mainColor,
  title: Text("NewsApp",style: TextStyle(
  color: Colors.white
  ),),
  ) ,
  body: Stack(
  children:<Widget>[
  WebView(
  key: key,
  initialUrl: url,
  javascriptMode: JavascriptMode.unrestricted,
  onPageFinished: (finish){
  setState(() {
  isloading = false;
  });
  },
  onWebViewCreated: (WebViewController webviewcontroller){
  _controller.complete(webviewcontroller);
  },
  navigationDelegate: (NavigationRequest request){
  if(request.url.startsWith(url)){
  return NavigationDecision.navigate;}
  else{
  _launchUrl(request.url,context);
  return NavigationDecision.prevent;}}
  ), isloading ? Center(child: CircularProgressIndicator(),) : Stack(),
  ],
  ),
  );
  }
  _launchUrl(String url,BuildContext context) async {
  if(await canLaunch(url)){
  await launch(url,forceSafariVC: true,forceWebView: true);}
  else{
  buildErrorWidget("error");
  throw'could not launch $url';
  }
  }

  }