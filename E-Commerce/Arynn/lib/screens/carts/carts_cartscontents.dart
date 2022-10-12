
import 'package:redux/redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ecommerce_app/state/model/model.dart';
import 'package:ecommerce_app/state/model/cart_model.dart';
import 'package:ecommerce_app/widgets/number_controller.dart';
import 'package:ecommerce_app/widgets/common/buttons/eleshop_buttons.dart';
import 'package:ecommerce_app/state/actions/cart_actions.dart';


//ignore:must_be_immutable
class CartsContents extends StatelessWidget{

  bool checkboxValue;
  // Function onCheckBoxChange;
  Map<int,int> chartNumber;

  CartsContents({
    Key?key,
    required this.checkboxValue,
    // required this.onCheckBoxChange,
    required this.chartNumber,
  }):super(key: key);

  Widget rowContainer (
      BuildContext context,
      Map<String,dynamic> map,
      String index,
      Map<String,Map<String,dynamic>> selectedCart,
      double subtotal,
      Map<String,int> numberOfCarts
  ){

    Widget instockWidget(){
      if (map["available"] == "1"){
        return const Text("In Stock",style:TextStyle(fontSize: 14,color:Colors.green,fontWeight:FontWeight.bold),);
      }else{
        return const Text("Not In Stock",style:TextStyle(fontSize: 14,color:Colors.red,fontWeight:FontWeight.bold));
      }
    }

    Widget productPrice (Map<String,dynamic> map){
      double price = map['productPrice'].toDouble();
      return Text('Tsh $price',style:const TextStyle(fontSize:16,color:Colors.black,fontWeight:FontWeight.w800),);
    }

    void onClickCheckBox (val){
      Map<String,Map<String,dynamic>> copiedSelectedCart = {...selectedCart};
      double copiedSubtotal = subtotal;
      int? num = numberOfCarts[index]??1;
      if (!copiedSelectedCart.containsKey(index)){
        copiedSelectedCart.addAll({index:map});
        copiedSubtotal+=(map["productPrice"]*num);
      }else{
        copiedSelectedCart.removeWhere((key, value) => key == index);
        copiedSubtotal-=(map["productPrice"]*num);
      }
     
      StoreProvider.of<AppState>(context).dispatch(
          SelectedCartListAction("SELECTED_CARTS_LIST",
          SelectedCartList(selectedCartList:copiedSelectedCart)
        )
      );
      StoreProvider.of<AppState>(context).dispatch(
          SubtotalAction("GET_SUBTOTAL",Subtotal(subtotal:copiedSubtotal))
      );
      // onCheckBoxChange(val,index);
    }

    bool checkIdInSelectedCarts(String id){
      bool currentValue = false;
      if (selectedCart.containsKey(id)){
        currentValue = true;
      }
      return currentValue;
    }
    
    return Row(
      mainAxisAlignment:MainAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Checkbox(
            activeColor:const Color(0xFF067f8f),
            value:checkIdInSelectedCarts(index),
             onChanged: (val)=>onClickCheckBox(val),
          ),
        ),
        SizedBox(
          child: Image.network(map["productImage"],width:100,height:80,fit: BoxFit.cover,),
        ),
        Expanded(
          child:Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.symmetric(vertical:5),
                  child: Text(map["productName"],style:const TextStyle(fontSize:16,color:Colors.black,fontWeight:FontWeight.w400)),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.symmetric(vertical:5),
                  child:productPrice(map) ,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.symmetric(vertical:5),
                  child: instockWidget(),
                )
              ]
            ),
          )
        )

      ],
      
    );

  }

  Widget deleteText(){
    return const Text('Delete',style:TextStyle(fontSize:16,color:Colors.black,fontWeight:FontWeight.w400));
  }

  void deleteCartItem (
    BuildContext context,
    List<dynamic>carts,
    String id,
    double subtotal,
    Map<String,Map<String,dynamic>> selectedCart,
    Map<String,int> numberOfCarts
  ){
    List<Map<String,dynamic>> copiedCart = [...carts];
    double copiedSubtotal = subtotal;
    Map<String,dynamic> currentObject = {};
    int? num = numberOfCarts[id]??1;
    for (int i=0;i < carts.length;i++){
      if (carts[i]["id"] == id){
        currentObject = carts[i];
        break;
      }
    }
    double newPrice = currentObject["productPrice"]??0;
    copiedCart.removeWhere((cart) =>cart["id"] == id );
    StoreProvider.of<AppState>(context).dispatch(CartListAction("CARTS_LIST",CartList(cartList:copiedCart)));
    if (selectedCart.containsKey(id)){
      copiedSubtotal-=(newPrice*num);
      StoreProvider.of<AppState>(context).dispatch(SubtotalAction("GET_SUBTOTAL",Subtotal(subtotal:copiedSubtotal)));
    }
  }

  List<Widget> getCartsContents(
                  BuildContext context,
                  List<dynamic>cartList,
                  Map<String,Map<String,dynamic>> selectedCarts,
                  double subtotal,
                  Map<String,int> numberOfCarts
                ){
    List <Widget> widget = [const SizedBox()]; 
    List<Widget> widgetArray = [];
    List<dynamic> carts = cartList;
    if (carts != null){
      for(int i =0;i < carts.length;i++){
        if (carts[i].isNotEmpty){
          Widget currentWidget = Container(
            width:MediaQuery.of(context).size.width*0.9,
            decoration: const BoxDecoration(color:Color(0xFFf5faf6)),
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start ,
              children: [
                Container(
                  child: rowContainer(context,carts[i],carts[i]["id"],selectedCarts,subtotal,numberOfCarts),
                ),
                Row(
                  children: [
                      Container(
                        padding: const EdgeInsets.only(left:20),
                        child:NumberController(
                          chartId:carts[i]["id"],
                          deleteCart:deleteCartItem,
                          carts:carts,
                      ),
                    ),
                    Expanded(child: 
                         Container(
                          margin:const EdgeInsets.only(left:10),
                          child: EleshopButton(
                            component:deleteText(),
                            backgroundColor:const Color(0xFFdee3df),
                            onpress:()=>deleteCartItem(
                                          context,
                                          carts,
                                          carts[i]["id"],
                                          subtotal,
                                          selectedCarts,
                                          numberOfCarts
                                        ),
                            height:40,
                          ),
                      )
                    ),
                    const Expanded(child:SizedBox())
                 
                  ],
                ),
            
             
              ]
            ),
          );
          widgetArray.add(currentWidget);
        }
      }
      widget = widgetArray;
    }
    return widget;
  }
  @override
  Widget build(BuildContext context){
    return StoreConnector<AppState,AppState>(
      converter:(Store <AppState> store)=>store.state,
      builder:(BuildContext context,AppState appState){
        return Container(
           width:MediaQuery.of(context).size.width,
           alignment: Alignment.center,
           child: Column(children:getCartsContents(
                                    context,
                                    appState.cartList?.cartList??[],
                                    appState.selectedCartList?.selectedCartList??{},
                                    appState.subtotal?.subtotal??0.00,
                                    appState.numberOfCharts?.numberOfCarts??{}
                                  )),
        );
      }
      
    );
  }

}