import 'dart:async';
import 'package:flutter/material.dart';
import 'package:znews/style/theme.dart' as Style;
import 'main_screen.dart';
class MyCustomSplashScreen extends StatefulWidget {
  const MyCustomSplashScreen({Key? key}) : super(key: key);

  @override
  State<MyCustomSplashScreen> createState() => _MyCustomSplashScreenState();
}

class _MyCustomSplashScreenState extends State<MyCustomSplashScreen> with TickerProviderStateMixin{
  double _fontSize = 2;
  double _counterSize = 1.5;
  double _TextOpecity = 0;
  double _CounterOpecity= 0.0;

  late AnimationController _controller;
  late Animation<double> animation1;
  late BuildContext mcontext  ;

  @override
  void initState() {
    _controller=AnimationController(vsync: this,duration: Duration(seconds: 3));
    animation1=Tween<double>(begin: 40,end: 20).animate(CurvedAnimation
      (parent: _controller, curve: Curves.fastLinearToSlowEaseIn))
      ..addListener(() {
        setState(() {
          _TextOpecity=1.0;
        });
      });
    _controller.forward();
    Timer(Duration(seconds: 2), () {
      setState(() {
        _fontSize=1.06;
      });
    });
    Timer(Duration(seconds: 2), () {
      setState(() {
        _counterSize=2;
        _CounterOpecity=1;
      });
    });
    Timer(Duration(seconds: 4), () {
      setState(() {
        Navigator.pushReplacement(mcontext, PageTransitions(MainScreen(),));
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mcontext=context;
    double _width=MediaQuery.of(context).size.width;
    double _height=MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Style.Colors.mainColor,
      body: Stack(
        children: [
          Column(
            children: [
              AnimatedContainer(duration: Duration(milliseconds: 2000,),
              curve: Curves.fastLinearToSlowEaseIn,
              height: _height/_fontSize,),
              AnimatedOpacity(opacity: _TextOpecity,
                  duration:Duration(microseconds: 1000),
              child: Text("Znews",
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
                  fontSize: animation1.value),),)
            ],
          ),
          Center(
            child: AnimatedOpacity(duration: Duration(milliseconds: 2000),
            curve: Curves.fastLinearToSlowEaseIn,
            opacity: _CounterOpecity,
            child: AnimatedContainer(duration: Duration(milliseconds: 2000),
            curve: Curves.fastLinearToSlowEaseIn,
            height: _width/_counterSize,
            width:  _width/_counterSize,
            alignment: Alignment.center,
            decoration: BoxDecoration(color: Colors.white,
            borderRadius: BorderRadius.circular(30),),
            child: Image.asset('assets/img/logo.png',
                alignment: Alignment.center,
            fit: BoxFit.fill,),),),
          )],),);
  }
}

class PageTransitions extends PageRouteBuilder{
  final Widget page;
  PageTransitions(this.page):super(
    pageBuilder: (context,animation,anotherAnimation)=>page,
    transitionDuration: Duration(milliseconds: 2000),
    transitionsBuilder:(context,animation,anotheranimation,child){
             animation=CurvedAnimation(curve: Curves.fastLinearToSlowEaseIn,
                          parent: animation,);
             return Align(
                          alignment: Alignment.bottomCenter,
                            child:SizeTransition(
                                    sizeFactor:animation ,
                                      child: page,
                              axisAlignment: 0,
                                      ) ,
                          );},
  );
}



