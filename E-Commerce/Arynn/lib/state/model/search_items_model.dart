
class ShowSearchWidget{
  bool showSearchWidget;
  ShowSearchWidget({required this.showSearchWidget});
  factory ShowSearchWidget.showSearchWidgetInitial()=>ShowSearchWidget(showSearchWidget:false);
}


class SearchedItems{
  List<Map<String,dynamic>> searchedProducts;
  SearchedItems({required this.searchedProducts});
  factory SearchedItems.searchedItemsInitial()=>SearchedItems(searchedProducts:[]);
}