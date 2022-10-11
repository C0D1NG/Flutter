
import 'package:flutter/material.dart';
import 'productcontents.dart';
import 'titleribbon.dart';
import 'package:ecommerce_app/widgets/common/appBar/search_appbar.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ecommerce_app/state/model/model.dart';
import 'package:ecommerce_app/state/model/search_items_model.dart';
import 'package:ecommerce_app/state/actions/searched_item_action.dart';
import 'package:ecommerce_app/helpers/helpers.dart';
import 'package:ecommerce_app/widgets/common/search_widget/search_widget.dart';


class AllProducts extends StatefulWidget{

  final List<Map<String,dynamic>> allProducts;
  final String title;

  const AllProducts({Key?key,required this.allProducts,required this.title}):super(key:key);

  @override
  State<AllProducts> createState()=>_AllProducts();

}

class _AllProducts extends State<AllProducts>{

  void onPressBack (BuildContext context){
    StoreProvider.of<AppState>(context).dispatch(ShowSearchWidgetAction("SHOW_SEARCH_WIDGET",ShowSearchWidget(showSearchWidget:false)));
    StoreProvider.of<AppState>(context).dispatch(SearchedItemsAction("SEARCHED_ITEM",SearchedItems(searchedProducts:[])));
    Navigator.pop(context);
  }

  void openSearchWidget(BuildContext context){
    StoreProvider.of<AppState>(context).dispatch(ShowSearchWidgetAction("SHOW_SEARCH_WIDGET",ShowSearchWidget(showSearchWidget:true)));
  }

  void closeSearchWidget(BuildContext context){
    StoreProvider.of<AppState>(context).dispatch(ShowSearchWidgetAction("SHOW_SEARCH_WIDGET",ShowSearchWidget(showSearchWidget:false)));
    StoreProvider.of<AppState>(context).dispatch(SearchedItemsAction("SEARCHED_ITEM",SearchedItems(searchedProducts:[])));
  }

  void onSearch (BuildContext context,String searchedKey){
    Store store = StoreProvider.of<AppState>(context);
    AppState currentState = store.state;
    bool currentShowSearched = currentState.showSearchWidget?.showSearchWidget??false;
    if (!currentShowSearched){
      store.dispatch(ShowSearchWidgetAction("SHOW_SEARCH_WIDGET",ShowSearchWidget(showSearchWidget:true)));
    }
    List<Map<String,dynamic>> returnedSearchedItems = Helper().getSearchedItems(searchedKey);
    store.dispatch(SearchedItemsAction("SEARCHED_ITEM",SearchedItems(searchedProducts:returnedSearchedItems)));
  }

  void navigationController (BuildContext context,String routeName,Map<String,dynamic> params){
    Navigator.pushNamed(context, routeName,arguments:params);
  }

  Widget getWidgets(bool showSearchedWidget,List<Map<String,dynamic>>searchedItems){
    Widget defaultWidget = Center(
        child:Column(
          children:<Widget>[
            Container(
              margin:const EdgeInsets.only(bottom:20),
              child:TitleRibon(title:widget.title,backgroundColor:const Color(0xFF97edf0)),
            ),
            Expanded(child: 
              GridView.builder(
              itemCount:widget.allProducts.length,
              shrinkWrap:true,
              gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2),
              itemBuilder: (context,index){
                return ProductContents(product:widget.allProducts[index]);
              }
            )
            )
        
          ]
          ),
    );
    if(showSearchedWidget){
      defaultWidget = SearchWidget(searchedItems:searchedItems,navigationController:navigationController);
    }
    return defaultWidget;
  }

  @override
  Widget build(BuildContext context){
   return StoreConnector<AppState,AppState>(
    converter:(Store <AppState> store)=>store.state,
    builder:(BuildContext context,appState){
      return Scaffold(
        backgroundColor:Colors.white,
        appBar:BackIconSearchAppBar(onSearch:onSearch,searchedKey:" ",onPressBack:onPressBack,onFocus:openSearchWidget),
        body:getWidgets(appState.showSearchWidget?.showSearchWidget??false,appState.searchedItems?.searchedProducts??[])
      );
    }
  );
  }
}