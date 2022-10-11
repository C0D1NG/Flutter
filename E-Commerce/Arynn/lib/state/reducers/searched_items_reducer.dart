
import '../model/search_items_model.dart';

ShowSearchWidget showSearchedWidgetReducer(ShowSearchWidget state,dynamic action){
  switch(action.type){
    case "SHOW_SEARCH_WIDGET":
      return action.payload;
    default:
      return state;
  }
}

SearchedItems searchedItemReducer(SearchedItems state,dynamic action){
  switch(action.type){
    case "SEARCHED_ITEM":
      return action.payload;
    default:
      return state;
  }
}