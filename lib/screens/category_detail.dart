import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:znews/bloc/get_category_news_bloc.dart';
import 'package:znews/elements/loader.dart';
import 'package:znews/model/article.dart';
import 'package:znews/model/articleresponse.dart';
import 'package:znews/model/source.dart';
import 'package:znews/style/theme.dart' as Style;
import 'package:timeago/timeago.dart' as timeago;
import 'dart:ui' as ui;
import '../elements/error_element.dart';
import 'news_detail.dart';
class categoryDetail extends StatefulWidget {
  final String category ;
  categoryDetail({Key? key, required this.category}) : super(key: key);
  @override
  _categoryDetailState createState() => _categoryDetailState(category);}
  class _categoryDetailState extends State<categoryDetail> {
    final String category;

    _categoryDetailState(this.category);

    String title = "title";
    List<String> cat = [
      "technology",
      "entertainment",
      "general",
      "health",
      "science",
      "sports",
      "business"
    ];
    List<String> catArabic = [
      "تكنولوجيا",
      "إجتماعيه",
      "عام",
      "صحه",
      "علوم",
      "رياضه",
      "إقتصاد"
    ];

    @override
    void initState() {
      super.initState();
      getCategoryNewsBloc.getCategoryNews(category);
      setState(() {
        int i = cat.indexWhere((element) => element == category);
        title = catArabic[i];

      });
    }

    @override
    void dispose() {
   getCategoryNewsBloc.drainStream();
   //getCategoryNewsBloc.dispose();

      super.dispose();
    }


    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.0),
              child: AppBar(
                flexibleSpace:  Padding(
                  padding: const EdgeInsets.only(top: 30,right: 10),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(title,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0
                      ),),
                  ),
                ),
                elevation: 2.0,
                backgroundColor: Style.Colors.mainColor,

                ),

            ),
       //   ),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(child: StreamBuilder<ArticleResponse>(
                  stream: getCategoryNewsBloc.subject.stream,
                  builder: (context, AsyncSnapshot<ArticleResponse> snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!.error != null &&
                          snapshot.data!.error.length > 0) {
                         print("hoterror:"+snapshot.data!.error);
                        return buildErrorWidget(snapshot.data!.error);
                          //Container();
                      }
                      return _buildCategoryNewsWidget(snapshot.data!);
                    } else if (snapshot.hasError) {
                      print("hoterror:"+snapshot.data!.error);
                      return buildErrorWidget(snapshot.data!.error);

                    } else {
                      return Shimmer.fromColors(child:
                      ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return _buildCategoryNewsShimmmerWidget();
                          }),
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!);
                    }
                  },
                ),)
              ],
            ),
          )
      );
    }

    Widget _buildCategoryNewsShimmmerWidget() {
      return Row(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8.0),
            width: MediaQuery
                .of(context)
                .size
                .width * 3 / 5,
            height: 130,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        .width * 2 / 5,
                    color: Colors.white,
                    alignment: Alignment.bottomRight,
                  ),
                ),
              ],
            ),
          ),
          Container(
            //  padding: EdgeInsets.only(right: 15.0),
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

    Widget _buildCategoryNewsWidget(ArticleResponse data) {
      List<ArticleModle> articles = data.articles;
      if (articles.length == 0) {
        return Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "No more news",
                style: TextStyle(color: Colors.black45),
              ),
            ],
          ),
        );
      } else {
        return
          ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>
                            DetailNews(article: articles[index])));
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(top: BorderSide(color: Colors.grey,
                          width: 1.0)),
                      color: Colors.white,
                    ),
                    height: 150,
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(
                              top: 10.0, left: 10.0, bottom: 10.0, right: 10.0
                          ),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 3 / 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(articles[index].title,
                                textAlign: TextAlign.right,
                                maxLines: 3,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 14.0
                                ),),
                              Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: <Widget>[
                                        Row(
                                            children: <Widget>[
                                              Text(timeUntil(
                                                  DateTime.parse(
                                                      articles[index].data)),
                                                style: TextStyle(
                                                    color: Colors.black26,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10.0
                                                ),),
                                            ])
                                      ],),
                                  ))
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
                          child:CachedNetworkImage(
                            imageUrl:  articles[index].img,
                            placeholder: (context, url) => buildLoadingWidget(),
                            errorWidget: (context, url, error) =>  Image.asset('assets/img/placeholder.jpg',
                                fit: BoxFit.cover,
                                width: double.maxFinite,
                                height:  MediaQuery.of(context).size.height*1/3
                            ),
                            //Icon(Icons.error),
                            fit: BoxFit.cover,
                            width: double.maxFinite,
                            height:  MediaQuery.of(context).size.height*1/3
                        ),

                        )
                      ],
                    ),
                  ),
                );
              }
        );
      }
    }

    String timeUntil(DateTime date) {
      return timeago.format(date, allowFromNow: true, locale: 'en');
    }


}