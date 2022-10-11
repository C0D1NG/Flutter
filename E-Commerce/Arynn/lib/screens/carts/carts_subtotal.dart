
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ecommerce_app/state/model/model.dart';



//ignore:must_be_immutable
class ShowSubTotal extends StatelessWidget{

  const ShowSubTotal({Key?key}):super(key:key);

  Widget getSubtotalText (double subtotal){
    return Text('$subtotal',style:const TextStyle(fontSize: 24,fontWeight:FontWeight.bold));
  }

  @override
  Widget build(BuildContext context){
    return StoreConnector<AppState,AppState>(
      converter:(Store <AppState> store)=>store.state,
      builder:(BuildContext context,AppState appState){
        return Container(
          margin: const EdgeInsets.only(top:20,bottom:20),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          child:SizedBox(
            width: MediaQuery.of(context).size.width*0.9,
            child: Row(
              children: [
                const Text('Subtotal',style:TextStyle(fontSize:24,fontWeight:FontWeight.w500),),
                const SizedBox(child:Text(" ")),
                const Text("Tsh",style:TextStyle(fontSize:14,fontWeight:FontWeight.w300,color: Colors.black)),
                Expanded(
                  child:getSubtotalText(appState.subtotal?.subtotal??0.00)
                )
              ],
            ),
          ) 
        );
      }
    );
  }
}