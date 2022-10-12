
// import 'package:ecommerce_app/sampleData/data.dart';

class CartList{
  List<dynamic> cartList;

  CartList({required this.cartList});

  List<dynamic> get ()=>cartList;

  factory CartList.carlistInitial()=>CartList(cartList:[]);
}

class SelectedCartList{
    Map<String,Map<String,dynamic>> selectedCartList;
    SelectedCartList({required this.selectedCartList});
    factory SelectedCartList.selectedCarListInitial()=>SelectedCartList(selectedCartList:{});
}

class Subtotal {

  double subtotal;

  Subtotal({required this.subtotal});

  factory Subtotal.subtotalInitial()=>Subtotal(subtotal:0);

}

class NumberOfCharts{

  Map<String,int> numberOfCarts;

  NumberOfCharts({required this.numberOfCarts});

  factory NumberOfCharts.numberOfCartsInitial()=>NumberOfCharts(numberOfCarts:{});
}