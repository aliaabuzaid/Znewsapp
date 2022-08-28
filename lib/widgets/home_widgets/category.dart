import 'package:flutter/material.dart';
import 'package:znews/screens/category_detail.dart';
import 'package:znews/style/theme.dart' as Style;
class categoryWidget extends StatefulWidget {
  const categoryWidget({Key? key}) : super(key: key);
  @override
  _categoryWidgetState createState() => _categoryWidgetState();}
  class _categoryWidgetState extends State<categoryWidget> {

  @override
  Widget build(BuildContext context) {

  List<String> cat=["business","entertainment","general","health","science","sports","technology"];
  List<String> catArabic=["إقتصاد","إجتماعيه","عامه","صحه","علوم","رياضه","تكنولوجيا"];

  return
  Directionality(
      textDirection:TextDirection.rtl ,
      child: Container(
       //padding: const EdgeInsets.all(5.0),
      height: 50,

      child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: cat.length,
      itemBuilder: (context, index) {
      return
          Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
             // padding: const EdgeInsets.symmetric(horizontal: 4),

          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ChoiceChip(
                       label:Container(
                         width: MediaQuery.of(context).size.width/5,
                        // padding: EdgeInsets.symmetric(vertical: 5.0),
                         alignment: Alignment.center,
                        // color: Colors.deepOrange,
                         child: Text(catArabic[index],
                      style: TextStyle(
                           color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery
                                .of(context)
                                .size
                                .width*.05,
                      ),),
                       ) ,
                          selected: false,
                      elevation: 5,
                      pressElevation: 5,
                      shadowColor: Style.Colors.secondColor,
                      backgroundColor: Style.Colors.titleColor,
                      selectedColor: Style.Colors.mainColor,
                     // padding: const EdgeInsets.all(5),
                      onSelected:(bool selected){
                        if(selected){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder:
                                   (context) => categoryDetail(
                                  category: cat[index]
                              )));} },),
          ),




        ],


         );
      },
      ),
      ),

  );

}


}