import 'dart:async';
enum NavBarItem{HOME , SOURCES , SEARCH}
class BottomNavBarBloc{
  final StreamController<NavBarItem>  navBarController = StreamController.broadcast();
  NavBarItem defaultItem =NavBarItem.HOME;
  Stream<NavBarItem> get itemStream => navBarController.stream;
  void pickItem(int i){
    switch(i){
      case 0:
        navBarController.sink.add(NavBarItem.HOME);
        break;
      case 1:
        navBarController.sink.add(NavBarItem.SOURCES);
        break;
      case 2:
        navBarController.sink.add(NavBarItem.SEARCH);
        break;
    }
  }
  close() {
    navBarController.close();
  }}