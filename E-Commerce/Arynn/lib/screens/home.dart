import 'package:ecommerce_app/widgets/column_widget.dart';
import 'package:flutter/material.dart';
// import 'package:ecommerce_app/widgets/delivery_location_widget.dart';
import 'package:ecommerce_app/widgets/initial_contents_widget.dart';

class HomeScreen extends StatelessWidget{

  const HomeScreen({Key?key}):super(key: key);

  @override 
  Widget build(BuildContext context){
    return SafeArea(
        child: ListView(
          children: const [
            FixedListContents(),
          ],
        ),
    );
  }
}

class FixedListContents extends StatelessWidget{
  const FixedListContents({super.key});

  @override 
  Widget build (BuildContext context){
    return Container(
              // height: MediaQuery.of(context).size.height-50,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(color:Color(0xFFe1e6e2)),
              child:Column(
                mainAxisAlignment:MainAxisAlignment.start,
                crossAxisAlignment:CrossAxisAlignment.center,
                children: const [
                //   DeliveryLocationWidget(
                //   location: "Dar es salaam,Tanzania",
                //   containerHeight:50 ,
                //   backgroundColor:Color(0xFF97edf0)
                // ),
                InitialContentsWidget(),
                ColumnWidget()
              ]
            ),
        );
    }
}
