
import 'package:flutter/material.dart';
import 'carts_cartscontents.dart';

//ignore:must_be_immutable
class CartsListWidget extends StatelessWidget{

  double? subtotal;
  int? numberOfItems;
  bool? checkboxValue;
  Function? onCheckBoxChange;
  Map<int,int>? chartNumber;


  CartsListWidget({
    Key?key,
    this.subtotal,
    this.checkboxValue,
    this.onCheckBoxChange,
    this.chartNumber,
    }):super(key:key);

  @override 
  Widget build (BuildContext context){
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.9,
      child: CartsContents(
        checkboxValue:checkboxValue??false,
        // onCheckBoxChange:onCheckBoxChange??()=>{},
        chartNumber:chartNumber??{},
      )
    );
    
  }
}