import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:znews/bloc/bottom_navbar_bloc.dart';
import 'package:znews/style/theme.dart' as Style;
import 'tabs/home_screen.dart';
import 'tabs/search_screen.dart';
import 'tabs/sudan_news_screen.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  _MainScreenState createState() => _MainScreenState();}
  class _MainScreenState extends State<MainScreen> {
  late BottomNavBarBloc _bottomNavBarBloc;
  @override
  void initState() {
  super.initState();
  _bottomNavBarBloc =BottomNavBarBloc();
  }
  @override
  Widget build(BuildContext context) {
  return Scaffold(
  backgroundColor: Colors.white ,
  appBar: PreferredSize(
  preferredSize: Size.fromHeight(50.0),
  child: AppBar(
  backgroundColor: Style.Colors.mainColor,
  title: Text("Znews",style: TextStyle(
  color: Colors.white
  ),),
  ),
  ),
  body: SafeArea(
  child: StreamBuilder<NavBarItem>(
  stream: _bottomNavBarBloc.itemStream,
  initialData: _bottomNavBarBloc.defaultItem,
  builder: (BuildContext context ,AsyncSnapshot<NavBarItem> snapshot){
  switch(snapshot.data!){
  case NavBarItem.HOME:
  return HomeScreen();
  case NavBarItem.SOURCES:
  return SourceScreen();
  case NavBarItem.SEARCH:
  return SearchScreen();
  }
  },
  ),
  ),
  bottomNavigationBar: StreamBuilder(
  stream: _bottomNavBarBloc.itemStream,
  initialData: _bottomNavBarBloc.defaultItem,
  builder: (BuildContext context ,AsyncSnapshot<NavBarItem> snapshot){
  return Container(
  decoration: BoxDecoration(
  borderRadius: BorderRadius.only(
  topRight: Radius.circular(30),topLeft: Radius.circular(30),
  ),
  boxShadow: [
  BoxShadow(
  color: Colors.grey,spreadRadius: 0,blurRadius: 10
  )
  ]
  ),
  child: ClipRRect(
  borderRadius: BorderRadius.only(
  topLeft: Radius.circular(30.0),topRight: Radius.circular(30)
  ),
  child: BottomNavigationBar(
  backgroundColor: Colors.white,
  iconSize: 20,
  unselectedFontSize: 9.5,
  unselectedItemColor: Style.Colors.mainColor,
  selectedFontSize: 9.5,
  type: BottomNavigationBarType.fixed,
  fixedColor: Style.Colors.secondColor,
  currentIndex: snapshot.data!.index,
  onTap:_bottomNavBarBloc.pickItem ,
  items: const [
  BottomNavigationBarItem(
  icon: Icon(EvaIcons.homeOutline),
  activeIcon: Icon(EvaIcons.home),
  // label:  ("Home"), //paddiig here

  label: "Znews"),
  BottomNavigationBarItem(
  icon: Icon(EvaIcons.gridOutline),
  activeIcon: Icon(EvaIcons.grid),
  label: "أخبار السودان"
  ),

  BottomNavigationBarItem(
  icon: Icon(EvaIcons.searchOutline),
  activeIcon: Icon(EvaIcons.search),
  // label:  ("Home"), //paddiig here
 label: "بحث"),],
  ),
  ),
  );
  }
  ),
  );
  }
  Widget testScreen(){
  return Container(
  color: Colors.white,
  width: MediaQuery.of(context).size.width,
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: <Widget>[
  Text("TestSCREEN")
  ],
  ),
  );
  }}