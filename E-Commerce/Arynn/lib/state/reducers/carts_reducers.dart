
import 'package:ecommerce_app/state/model/cart_model.dart';

CartList cartListReducers(CartList state,dynamic action){
    switch(action.type){
      case "CARTS_LIST":
        return action.payload;
      default:
        return state;
    }
}

SelectedCartList selectedCartListreducer(SelectedCartList state,dynamic action){
    switch(action.type){
      case "SELECTED_CARTS_LIST":
        return action.payload;
      default:
        return state;
    }
}

Subtotal getSubtotalReducer(Subtotal state,dynamic action){
  switch(action.type){
    case "GET_SUBTOTAL":
      return action.payload;
    default:
      return state;
  }
}

NumberOfCharts getNumberOfCartsReducer(NumberOfCharts state,dynamic action){
  switch(action.type){
    case "NUMBER_OF_CARTS":
      return action.payload;
    default:
      return state;
  }
}