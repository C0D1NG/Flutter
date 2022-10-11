
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ecommerce_app/state/model/model.dart';
import 'package:ecommerce_app/state/actions/cart_actions.dart';
import 'package:ecommerce_app/state/model/cart_model.dart';

//ignore:must_be_immutable
class NumberController extends StatelessWidget{

    String chartId;
    Function deleteCart;
    List<dynamic> carts;

    NumberController({
      Key?key,
      required this.chartId,
      required this.deleteCart,
      required this.carts
    }):super(key: key);

    Icon iconType (Map<String,int> numberOfCharts){
      int? val = numberOfCharts[chartId];
      if (val != null){
        if (val > 1){
          return const Icon(Icons.remove,color:Colors.black,);
        }else{
          return const Icon(Icons.delete,color:Colors.black,);
        }
      }
      return const Icon(Icons.delete,color:Colors.black,);
    }

    Widget getChartNumber(Map<String,int> numberOfCharts){
      int? val = numberOfCharts[chartId];
      if (val != null){
        return Text('$val',style:const TextStyle(color: Color(0xFF067f8f),fontSize:16,fontWeight:FontWeight.bold));
      }else{
        return const Text('1',style:TextStyle(color: Color(0xFF067f8f),fontSize:16,fontWeight:FontWeight.bold));
      }
    }

    void onIncrement(
      BuildContext context,
      Map<String,int> numberOfCharts,
      double subtotal,
      List<dynamic> carts,
      Map<String,Map<String,dynamic>> selectedCart,
    ){
      int currentInc = numberOfCharts[chartId]??1;
      currentInc += 1;
      Map<String,int> copiedNumberOfCarts = {...numberOfCharts};
      double copiedSubtotal = subtotal;
      Map<String,dynamic> map = {};
      double price;
      if (copiedNumberOfCarts.containsKey(chartId)){
        copiedNumberOfCarts.update(chartId, (value) => currentInc);
      }else{
        copiedNumberOfCarts.addAll({chartId:currentInc});
      }
      for (int i=0;i < carts.length;i++){
        if (carts[i]["id"] == chartId){
          map = carts[i];
          break;
        }
      }
      if (map != null){
        price = map["productPrice"];
      }else{
        price = 0;
      }
      StoreProvider.of<AppState>(context).dispatch(NumberOfCartsAction("NUMBER_OF_CARTS",NumberOfCharts(numberOfCarts:copiedNumberOfCarts)));
      if (selectedCart.containsKey(chartId)){
        copiedSubtotal+=price;
        StoreProvider.of<AppState>(context).dispatch(SubtotalAction("GET_SUBTOTAL",Subtotal(subtotal:copiedSubtotal)));
      }
    }

    void ondecrement(
      BuildContext context,
      Map<String,int> numberOfCarts,
      double subtotal, 
      Map<String,Map<String,dynamic>> selectedCart,
      List<dynamic> carts,
    ){
      int currentInc = numberOfCarts[chartId]??1;
      double price;
      Map<String,dynamic> map = {};
      Store store = StoreProvider.of<AppState>(context);
      double copiedSubtotal = subtotal;

      if (currentInc > 1){
        currentInc -=1;
        Map<String,int> copiedNumberOfCarts = {...numberOfCarts};
        if (copiedNumberOfCarts.containsKey(chartId)){
          copiedNumberOfCarts.update(chartId, (value) => currentInc);
        }else{
          copiedNumberOfCarts.addAll({chartId:currentInc});
        }
        for (int i=0;i < carts.length;i++){
          if (carts[i]["id"] == chartId){
            map = carts[i];
            break;
          }
        }
        if (map != null){
          price = map["productPrice"];
        }else{
          price = 0;
        }
        store.dispatch(NumberOfCartsAction("NUMBER_OF_CARTS",NumberOfCharts(numberOfCarts:copiedNumberOfCarts)));
        if (selectedCart.containsKey(chartId)){
          copiedSubtotal-=price;
          store.dispatch(SubtotalAction("GET_SUBTOTAL",Subtotal(subtotal:copiedSubtotal)));
        }
      }else{
        deleteCart(context,carts,chartId,subtotal,selectedCart,numberOfCarts);
      }
    }

    @override
    Widget build (BuildContext context){
      return StoreConnector<AppState,AppState>( 
        converter:(Store <AppState> store)=>store.state,
        builder:(BuildContext context,AppState appState){
          return(
             Container(
          height: 40,
          width: 120,
          margin:const EdgeInsets.symmetric(vertical:20),
          decoration: BoxDecoration(
            border:Border.all(color:Colors.grey,width:1),
            borderRadius: BorderRadius.circular(10),
            color:const Color(0xFFedf2ee),
          ),
          child:Row(
            children: [
              Expanded(
                child:Container(
                  alignment:Alignment.center,
                  child:IconButton(
                    icon:iconType(appState.numberOfCharts?.numberOfCarts??{}),
                    onPressed:()=>ondecrement(
                                    context,
                                    appState.numberOfCharts?.numberOfCarts??{},
                                    appState.subtotal?.subtotal??0.00,
                                    appState.selectedCartList?.selectedCartList??{},
                                    appState.cartList?.cartList??[],                                  
                                  ),
                    // onPressed:()=>onchange("minus",chartId) ,
                  ),
                )
              ),
              Expanded(
                child:Container(
                  height:40,
                  alignment:Alignment.center,
                  decoration:const BoxDecoration(
                    border:Border(
                      left:BorderSide(color:Colors.grey,width:1),
                      right:BorderSide(color:Colors.grey,width:1)
                    ),
                    color:Colors.white
                  ),
                  child: getChartNumber(appState.numberOfCharts?.numberOfCarts??{}),
                  // child:getNumText(),
                  // child: Text('$num',style:const TextStyle(color: Color(0xFF067f8f),fontSize:16,fontWeight:FontWeight.bold)),
                )
              ),
              Expanded(
                child:Container(
                  alignment:Alignment.center,
                  child:IconButton(
                    icon:const Icon(Icons.add,color:Colors.black),
                    onPressed:()=>onIncrement(
                                    context,
                                    appState.numberOfCharts?.numberOfCarts??{},
                                    appState.subtotal?.subtotal??0.00,
                                    appState.cartList?.cartList??[],
                                    appState.selectedCartList?.selectedCartList??{}
                                  ),
                    // onPressed:()=>onchange("plus",chartId) ,
                  ),
                ),
              )
            ]
          ),
      )
          );
        }
      );
      
      
     
    }
}