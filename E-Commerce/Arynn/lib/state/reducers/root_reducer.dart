
import 'package:ecommerce_app/state/model/visibility.dart';
import 'carts_reducers.dart';
import 'visibility_reducer.dart';
import 'searched_items_reducer.dart';
import '../model/model.dart';
import '../model/cart_model.dart';
import '../model/search_items_model.dart';

AppState appReducer (AppState state,action){
  return AppState(
    selectedCartList:selectedCartListreducer(state.selectedCartList??SelectedCartList(selectedCartList:{}),action),
    cartList:cartListReducers(state.cartList??CartList(cartList:[]), action),
    componentIndex:visibilityReducer(state.componentIndex??Visibility(componentIndex:0), action),
    numberOfCharts:getNumberOfCartsReducer(state.numberOfCharts??NumberOfCharts(numberOfCarts: {}), action),
    subtotal:getSubtotalReducer(state.subtotal??Subtotal(subtotal:0), action),
    showSearchWidget:showSearchedWidgetReducer(state.showSearchWidget??ShowSearchWidget(showSearchWidget:false), action),
    searchedItems:searchedItemReducer(state.searchedItems??SearchedItems(searchedProducts:[]),action)
  );
}
