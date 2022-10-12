
import 'package:flutter/material.dart';
// import 'package:ecommerce_app/widgets/delivery_location_widget.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:ecommerce_app/widgets/common/buttons/eleshop_buttons.dart';
import 'carts_subtotal.dart';
import 'carts_cartslist.dart';

class CartScreen extends StatefulWidget{

  const CartScreen({Key?key}):super(key:key);

  @override
  State<CartScreen> createState ()=>_CartScreen();
}

class _CartScreen extends State<CartScreen>{
  
  double subTotalPrice = 0;
  int numberOfItems = 0;
  bool checkboxValue = false;
  // List<int> ids = [];
  Map<int,int> chartNumber = {};

  void getSubtotalPrice(double price){
    setState(() {
        subTotalPrice += price;
    });
  }

  void checkItems(bool val){
    setState(() {
      if (val){
        numberOfItems += 1;
      }else {
        if (numberOfItems > 0){
          numberOfItems -= 1;
        }
      }
    });
  }

  void onpressCheckout (){
    print("checkout");
  }

  // void onCheckBoxChange(bool val,int id){
  //   setState(() {
  //     if (val){
  //       if(!ids.contains(id)){
  //         ids.add(id);
  //       }
  //     }else{
  //       if (ids.contains(id)){
  //         ids.remove(id);
  //       }
  //     }
  //     checkboxValue = val;
  //   });
  // }

  Widget checkoutPriceText(){
    return Text('Proceed to checkout ($numberOfItems items)',style:const TextStyle(fontSize:16,color:Colors.black,fontWeight:FontWeight.w400));
  }

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child:ListView(
        children: <Widget>[
          // const DeliveryLocationWidget(
          //   location:"Dar es salaam,Tanzania",  
          //   containerHeight:50 ,
          //   backgroundColor:Color(0xFF97edf0)
          // ),
          const ShowSubTotal(),
          StickyHeader(
              header:Container(
                width:MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child:SizedBox(
                    width: MediaQuery.of(context).size.width*0.9,
                    child:EleshopButton(component: checkoutPriceText(),onpress: onpressCheckout),  
                  )
                ,
              ),
              content:Container(
                alignment: Alignment.center,
                child:CartsListWidget(
                  checkboxValue:checkboxValue,
                  // onCheckBoxChange:onCheckBoxChange,
                  chartNumber:chartNumber,
                ) ,
              )
          )
        ],
      ) ,
    );
  }
}

