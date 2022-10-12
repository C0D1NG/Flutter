
import 'cart_model.dart';
import 'visibility.dart';
import 'search_items_model.dart';

class AppState{

  CartList? cartList;
  SelectedCartList? selectedCartList;
  Visibility? componentIndex;
  Subtotal? subtotal;
  NumberOfCharts? numberOfCharts;
  ShowSearchWidget? showSearchWidget;
  SearchedItems? searchedItems;
 
  AppState({
    this.cartList,
    this.componentIndex,
    this.selectedCartList,
    this.subtotal,
    this.numberOfCharts,
    this.showSearchWidget,
    this.searchedItems,
  });

  factory AppState.initialState()=>AppState(
    cartList:CartList.carlistInitial(),
    componentIndex:Visibility.visibilityInitial(),
    selectedCartList:SelectedCartList.selectedCarListInitial(),
    subtotal:Subtotal.subtotalInitial(),
    numberOfCharts:NumberOfCharts.numberOfCartsInitial(),
    searchedItems:SearchedItems.searchedItemsInitial(),
    showSearchWidget:ShowSearchWidget.showSearchWidgetInitial()
  );

}