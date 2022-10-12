
import '../model/search_items_model.dart';

class ShowSearchWidgetAction{
  ShowSearchWidget payload;
  String type;
  ShowSearchWidgetAction(this.type,this.payload);
}

class SearchedItemsAction{
  SearchedItems payload;
  String type;
  SearchedItemsAction(this.type,this.payload);
}