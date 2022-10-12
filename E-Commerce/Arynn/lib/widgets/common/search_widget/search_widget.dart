
import 'package:flutter/material.dart';

//ignore:must_be_immutable
class SearchWidget extends StatelessWidget{

  List<Map<String,dynamic>> searchedItems;
  Function navigationController;

  SearchWidget({Key?key,required this.searchedItems,required this.navigationController}):super(key:key);

  @override
  Widget build (BuildContext context){
    return Container(
      decoration:const BoxDecoration(color:Colors.white),
      child:ListView.builder(
        itemCount:searchedItems.length,
        itemBuilder:(BuildContext context,index){
          return GestureDetector (
            onTap:()=>navigationController(context,'/singleproduct',searchedItems[index]),
            child:Container(
              alignment:Alignment.centerLeft,
              padding: const EdgeInsets.only(left:20),
              child:Container(
                height:60,
                alignment:Alignment.centerLeft, 
                child:Text(
                  '${searchedItems[index]["productName"]}',
                  style:const TextStyle(fontSize:16,color:Colors.black,fontWeight:FontWeight.w500),
                ),
              ),
            ),
          );
        }
      ),
    );
  }

}