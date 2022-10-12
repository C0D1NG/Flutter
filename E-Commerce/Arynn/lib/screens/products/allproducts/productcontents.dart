
import 'package:flutter/material.dart';

//ignore:must_be_immutable
class ProductContents extends StatelessWidget{
  
  Map<String,dynamic> product;

  ProductContents({Key?key,required this.product}):super(key:key);

  Widget instockWidget(){
      if (product["available"] == "1"){
        return const Text("In Stock",style:TextStyle(fontSize: 12,color:Colors.green,fontWeight:FontWeight.bold),);
      }else{
        return const Text("Not In Stock",style:TextStyle(fontSize: 12,color:Colors.red,fontWeight:FontWeight.bold));
      }
    }

  @override
  Widget build (BuildContext context){
    return Column(
      children: [
        Container(
          margin:const EdgeInsets.symmetric(horizontal:20),
          alignment:Alignment.center,
          // width:100,
          height:120,
          decoration:BoxDecoration(color:const Color(0xFFdce0de),borderRadius:BorderRadius.circular(10)),
          child:GestureDetector(
            onTap:()=>Navigator.pushNamed(context,"/singleproduct",arguments:product),
            child:Image.network(product["productImage"],width:100,height:100,fit:BoxFit.cover
          )        
 ,)
        ),
        Expanded(
          child:Container(
            margin:const EdgeInsets.only(top:10,left:20,right:20),
            alignment:Alignment.center,
            child:Column(
            children: [
              Expanded(
                child:Container(
                  margin:const EdgeInsets.only(top:2),
                  alignment:Alignment.centerLeft,
                  child:Text(product["productName"],style:const TextStyle(fontSize:16,color:Colors.black,fontWeight:FontWeight.bold)),
                ),
              ),
              Expanded(
                child:Container(
                  alignment:Alignment.centerLeft,
                  margin:const EdgeInsets.only(top:2),
                  child:Text('${product["productPrice"]} Tsh',style:const TextStyle(fontSize:14,color:Color.fromARGB(255, 3, 7, 73),fontWeight:FontWeight.bold)),
                ) 
              ),
              Expanded(
                child:Container(
                  alignment:Alignment.centerLeft,
                  margin:const EdgeInsets.only(top:2),
                  child:instockWidget(),
                ) 
              )
            ]
          ),
        )
        )
  
      ],
    );
  }

}