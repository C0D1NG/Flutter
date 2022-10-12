

import 'package:ecommerce_app/state/actions/cart_actions.dart';
import 'package:ecommerce_app/state/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/widgets/common/buttons/eleshop_buttons.dart';
import 'package:ecommerce_app/widgets/common/appBar/back_icon_header.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ecommerce_app/state/model/model.dart';
import 'package:ecommerce_app/state/actions/searched_item_action.dart';
import 'package:ecommerce_app/state/model/search_items_model.dart';
import './process.dart';


//ignore:must_be_immutable
class SingleProduct extends StatefulWidget{
  
  Map<String,dynamic> singleProduct;

  SingleProduct({Key?key,required this.singleProduct}):super(key:key);

  @override
  State<SingleProduct> createState() => _SingleProduct();
}

class _SingleProduct extends State<SingleProduct>{

  @override
  void initState() {
    super.initState();
  }

  Widget showItemImage (BuildContext context){
    Widget defaultWidget = const SizedBox();
    if (widget.singleProduct.isNotEmpty){
      defaultWidget = Container(
        width:MediaQuery.of(context).size.width*0.9,
        height: MediaQuery.of(context).size.height*0.4,
        decoration:const BoxDecoration(color:Colors.transparent),
        child:Image.network(
          widget.singleProduct["productImage"],
          fit:BoxFit.fill,
        )
      ,);
    }
    return defaultWidget;
  }

  Widget addCartText(String text){
    return Text(text);
  }

  void addToCartAction(BuildContext context,List<dynamic> cartList){
    Store store = StoreProvider.of<AppState>(context);
    List<Map<String,dynamic>> copiedCartList = [...cartList];
    if (widget.singleProduct.isNotEmpty){
      copiedCartList.add(widget.singleProduct);
      store.dispatch(CartListAction("CARTS_LIST",CartList(cartList:copiedCartList)));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text("Item added to the cart")));
    }
    Map<String,dynamic> copiedSingleProduct = {};
    copiedSingleProduct.addAll({
      "productName":widget.singleProduct["productName"],
      "productPrice":'${widget.singleProduct["productPrice"]}',
      "productImage":widget.singleProduct["productImage"],
      "available":widget.singleProduct["available"]
    });
    postCarts(copiedSingleProduct).then((value) => print(value));
  }

  Widget showProductDescription(List<dynamic> cartList){
    Widget defaultWidget = const SizedBox();
    if (widget.singleProduct.isNotEmpty){
      defaultWidget = Container(
        alignment:Alignment.centerLeft,
        width:MediaQuery.of(context).size.width*0.9,
        child: Column(
        children: [
          Container(
            margin:const EdgeInsets.symmetric(vertical:10),
            child:Column(
              children: [
                Container(
                  alignment:Alignment.centerLeft,
                  child:Text(
                    widget.singleProduct["productName"],
                    style:const TextStyle(fontSize:20,color:Colors.black,fontWeight:FontWeight.w500),
                  ),
                ),
                Container(
                  alignment:Alignment.centerLeft,
                  child:Text(
                    '${widget.singleProduct["productPrice"]} Tsh',
                    style:const TextStyle(fontSize:20,color:Colors.black,fontWeight:FontWeight.w500),
                  )
                ),
              ]
            )
          ),
          Container(
            margin:const EdgeInsets.symmetric(vertical:10),
            child:Text(widget.singleProduct["productDescription"])
          ),
          SizedBox(
            child:EleshopButton(
              component:addCartText("Add to cart"),
              onpress:()=>addToCartAction(context,cartList), 
            )
          )
        ]
      ),
    ); 
  }
  return defaultWidget;
  }

  void onPressBack (BuildContext context){
    Store store = StoreProvider.of<AppState>(context);
    store.dispatch(ShowSearchWidgetAction("SHOW_SEARCH_WIDGET",ShowSearchWidget(showSearchWidget:false)));
    store.dispatch(SearchedItemsAction("SEARCHED_ITEM",SearchedItems(searchedProducts:[])));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context){
   return StoreConnector<AppState,AppState>(
    converter:(Store <AppState> store)=>store.state,
    builder:(BuildContext context,appState){
      return Scaffold(
        backgroundColor:Colors.white,
        appBar:BackIconHeader(onpress:onPressBack),
        body:Center(
          child:Column(
            children: [showItemImage(context),Expanded(child:showProductDescription(appState.cartList?.cartList??[]))],
      )
    ),
   );
    }
  );
   
 
  }
}