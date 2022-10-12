
import 'package:flutter/material.dart';
import './categorywidgets/category_widget.dart';


class InitialContentsWidget extends StatelessWidget{
  
  const InitialContentsWidget({Key?key}):super(key: key);

  @override
  Widget build(BuildContext context){
    return SizedBox(
      height:(MediaQuery.of(context).size.height-50)*0.3,
      width: MediaQuery.of(context).size.width,
      child:Center(
             child:Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                children: [
                    Positioned(
                      top:0,
                      left:0,
                      child:Container(
                        height:(MediaQuery.of(context).size.height-50)*0.5,
                        width:MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                            color:Colors.transparent
                          // color: Color(0xFFe1e6e2)
                        ),
                        child:Image.network('https://picsum.photos/200/300',fit:BoxFit.fill,),
                      )
                    ),
                    Positioned(
                      top:((MediaQuery.of(context).size.height-50)*0.1)/2,
                      left:10,
                      right:10,
                      child:Container(
                        height:((MediaQuery.of(context).size.height-50)*0.5)/2,
                        width:MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          color: Colors.transparent
                        ),
                        child:const CategoryWidget(),
                      )
                    )
                ],
              ),
            ),
        );
  }
}