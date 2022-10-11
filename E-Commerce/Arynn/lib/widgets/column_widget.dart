
import 'package:flutter/material.dart';
import 'package:ecommerce_app/sampleData/data.dart';

class ColumnWidget extends StatelessWidget{

  const ColumnWidget({Key?key}):super(key: key);

  Widget getWidget(List<Map<String,dynamic>> val){
    List<Widget> widgetList = [];
    for (Map<String,dynamic> content in val){
      widgetList.add(DiplayTitle(productOBject:content));
    }
    return Column(children:widgetList);
  }

  @override 
  Widget build (BuildContext context){
    return(getWidget(testingDatas));    
  }
}


// ignore:must_be_immutable
class DiplayTitle extends StatelessWidget{

  Map<String,dynamic> productOBject;

  DiplayTitle({Key?key,required this.productOBject}):super(key: key);

  @override
  Widget build (BuildContext context){
    return Container(
              decoration: const BoxDecoration(color: Colors.white),
              margin:const EdgeInsets.only(top:0),
              child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height:50,
                  width:MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(left:10,top:20),
                  child:Text(productOBject["title"],style: const TextStyle(fontSize:18,color: Colors.black,fontWeight:FontWeight.bold),)
                ),
                productOBject["title"] != "Best sellers" ?
                RenderColumnsContents(contents:productOBject["products"]):
                GridRendering(contents:productOBject["products"])
              ],
            ),
          );
  }

}

// ignore: must_be_immutable
class RenderColumnsContents extends StatelessWidget{

  List<Map<String,dynamic>> contents;

  RenderColumnsContents({Key?key,required this.contents}):super(key: key);

  Widget getRowContents (List<Map<String,dynamic>> val,BuildContext context){
    List<Widget> thoseWidgets = [];
    for(Map<String,dynamic> item in val){
      thoseWidgets.add(
        Container(
          width: MediaQuery.of(context).size.width-10,
          margin:const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
          child:  Row(
            children: [
              DisplayImageContents(content: item),
              Expanded(
                child:Container(
                  margin: const EdgeInsets.only(left: 20),
                  child:DisplayTextContents(contents:item)
                )
              )
            ]
          ) ,
        )
      );
    }
    return Column(
      children:thoseWidgets
    );
  }

  @override 
  Widget build (BuildContext context){
    return getRowContents(contents,context);
  }
}

//ignore:must_be_immutable
class GridRendering extends StatelessWidget{

  List<Map<String,dynamic>> contents;

  GridRendering({Key?key,required this.contents}):super(key: key);

  List<Widget> getWidgetArray( List<Map<String,dynamic>> contentArray){
     List<Widget> newArray = [];
     for (int i = 0;i < contentArray.length;i++){
        newArray.add(DisplayGridImage(product:contentArray[i]));
      }
    return newArray;
  }

  @override 
  Widget build(BuildContext context){
    return Wrap(
            direction:Axis.horizontal,
            children:getWidgetArray(contents),
          );
  }
}

//ignore:must_be_immutable
class DisplayGridImage extends StatelessWidget {

  Map<String,dynamic> product;

  DisplayGridImage({Key?key,required this.product}):super(key: key);

  @override 
  Widget build (BuildContext context){
    return GestureDetector(
      onTap:()=>Navigator.pushNamed(context,"/singleproduct",arguments:product),
      child:Container(
        width:(MediaQuery.of(context).size.width/2)-20,
        padding:const EdgeInsets.all(30),
        height:150,
        margin:const EdgeInsets.all(10),
        decoration: BoxDecoration(color:const Color(0xFFdce0de),borderRadius:BorderRadius.circular(10)),
        child:Image.network(
          product["productImage"],
          // width:10,
          // height:20,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}


// ignore: must_be_immutable
class DisplayImageContents extends StatelessWidget{
  
 Map<String,dynamic> content;

  DisplayImageContents ({Key?key,required this.content}):super(key:key);

  @override
  Widget build (BuildContext context){
    return GestureDetector(
      onTap:()=>Navigator.pushNamed(context,"/singleproduct",arguments:content),
      child:Container(
        alignment:Alignment.center,
        decoration:BoxDecoration(color:const Color(0xFFdce0de),borderRadius:BorderRadius.circular(10) ),
        padding:const EdgeInsets.all(10),
        height:80,
        width: 80,
        child: Image.network(content["productImage"]),
      ) ,
    );
  }

}

// ignore: must_be_immutable
class DisplayTextContents extends StatelessWidget{

  dynamic contents;

  DisplayTextContents({Key?key,required this.contents}):super(key:key);

  @override 
  Widget build (BuildContext context){
    return Column(
      crossAxisAlignment:CrossAxisAlignment.start,
      children: [
        Container(
          margin:const EdgeInsets.only(bottom:5),
          child:Text(
                    contents["productName"],
                    style:const TextStyle(fontSize:16,color: Colors.black,fontWeight:FontWeight.bold)
                  )
        ),
        Container(
          margin:const EdgeInsets.only(bottom:5),
          child:Text(
                    contents["productDescription"],
                    style:const TextStyle(fontSize:16,color: Colors.black,fontWeight:FontWeight.w300)
                  )
        ),
    
        SizedBox(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child:Text(
                  '${contents["productPrice"]} Tsh',
                  style:const TextStyle(color:Colors.black,fontWeight:FontWeight.bold,fontSize:14) ,)
              ),       
            ],
          ) ,
        )
      ],
    );
  }

}





