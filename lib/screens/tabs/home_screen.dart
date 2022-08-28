import 'package:flutter/material.dart';
import 'package:znews/bloc/get_hot_news_bloc.dart';
import 'package:znews/style/theme.dart' as Style;
import 'package:znews/widgets/home_widgets/headline_slider.dart';
import 'package:znews/widgets/home_widgets/hot_news.dart';
import 'package:znews/widgets/home_widgets/category.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();}
  class _HomeScreenState extends State<HomeScreen> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: RefreshIndicator(
          onRefresh: onRefresh,
        child: ListView(
          shrinkWrap: true,
          children: [
            HeadlingSliderWidget(),

            categoryWidget(),

            Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children : const <Widget>[
                    Text("أهم ألاخبار",
                      textAlign: TextAlign.right,

                      style: TextStyle(
                          color: Style.Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0
                      ),),
                  ],),),

            HotNewsWidget(),
          ],),)
      );
    }

  Future<void> onRefresh()async {
        HeadlingSliderWidget().createState().initState();
       // categoryWidget().createState().initState();
      return HotNewsWidget().createState().initState();
  }
}