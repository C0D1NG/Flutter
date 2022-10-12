
import 'package:ecommerce_app/state/model/cart_model.dart';


class CartListAction{
  CartList payload;
  String type;
  CartListAction(this.type,this.payload);
}

class SelectedCartListAction{
  SelectedCartList payload;
  String type;
  SelectedCartListAction(this.type,this.payload);
}

class SubtotalAction{
  Subtotal payload;
  String type;
  SubtotalAction(this.type,this.payload);
}

class NumberOfCartsAction{
  NumberOfCharts payload;
  String type;
  NumberOfCartsAction(this.type,this.payload);
}