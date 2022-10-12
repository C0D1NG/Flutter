
import 'package:flutter/material.dart';


class DeliveryLocationWidget extends StatelessWidget{

  final String location;
  final double containerHeight;
  final Color backgroundColor;

  const DeliveryLocationWidget({
    Key?key,
    required this.location,
    required this.backgroundColor,
    this.containerHeight=50
  }):super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
        height:containerHeight,
        decoration: BoxDecoration(
          color: backgroundColor
        ),
        child: Row(
          mainAxisAlignment:MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
              const SizedBox(width: 20),
              const Icon(Icons.location_on_outlined),
              const SizedBox(width:20),
              Expanded(child:  Text(location))
            
          ]
        ),
    );
  }
}