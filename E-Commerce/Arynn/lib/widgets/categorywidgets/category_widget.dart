import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ecommerce_app/sampleData/data.dart';
import 'package:ecommerce_app/screens/products/allproducts/routeargument.dart';
import './process.dart';

class CategoryWidget extends StatelessWidget{

  const CategoryWidget({super.key});
  @override
  Widget build(BuildContext context){
    return ListView(
      scrollDirection: Axis.horizontal,
      children: const [
        RowsContents()
      ],
    );
  }
}

class RowsContents extends StatelessWidget{

  const RowsContents({super.key});

  List<Widget> getWidgets (List<dynamic> categories){
    List<Widget> widgets = [];
    if (categories.isNotEmpty){
      for (Map<String,dynamic> category in categories){
        widgets.add(ContentsWidget(category:category));
      }
    }
    return widgets;
  }

  @override 
  Widget build (BuildContext context){
    return SizedBox(
      child:FutureBuilder(
        future:processCategoryContents(),
        builder:(BuildContext context,AsyncSnapshot<dynamic> snapshot){
          if (snapshot.connectionState != ConnectionState.done){
            const CircularProgressIndicator(backgroundColor:Colors.black,strokeWidth:10,);
          }
          if(snapshot.hasError){
            return Text("There is an err ${snapshot.error}");
          }
          if (!snapshot.hasData){
            return const SizedBox();
          }
          if (snapshot.data.statusCode != 200){
            return const SizedBox();
          }
          return Row(
            children:getWidgets(jsonDecode(snapshot.data.body)),
          );
        }
      ),
    );
    
  }
}

//ignore:must_be_immutable
class ContentsWidget extends StatelessWidget{

  Map<String,dynamic> category;

  ContentsWidget({super.key,required this.category});

  void showAllContentsInCategories (BuildContext context,String id,String categoryName){
    List<Map<String,dynamic>> categoryProducts = [];
    for (Map<String,dynamic> product in allElectronics){
      if (product["id"] == id){
        categoryProducts = product["products"];
      }
    }
    Navigator.pushNamed(context,"/allproducts",arguments:RouteArgument(categoryProducts,categoryName));
  }
  

  @override
  Widget build (BuildContext context){
    return GestureDetector(
      onTap: ()=>showAllContentsInCategories(context,category["id"],category["categoryName"]),
      child:Container(
        margin:const EdgeInsets.only(right:10),
        width:MediaQuery.of(context).size.width*0.35,
        height:(((MediaQuery.of(context).size.height-50)*0.45)/2)-30,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:BorderRadius.circular(10),
        ),
        alignment:Alignment.center,
        child:Column(
          children: [
            Expanded(
              child:Container(
                margin:const EdgeInsets.only(top:10),
                alignment:Alignment.center,
                child: Image.network(category["categoryImage"],width:80,height:60,),
              ),
            ),
            Expanded(
              child:Container(
                alignment:Alignment.center,
                child:Text(
                        category["categoryName"],
                        style:const TextStyle(
                          fontSize:14,
                          color:Colors.black,
                          fontWeight:FontWeight.bold
                        )),
              )
            )
          ]
        ),
      ) ,
    );
  }
}