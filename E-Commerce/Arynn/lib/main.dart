
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ecommerce_app/screens/home.dart';
// import 'package:ecommerce_app/screens/profile.dart';
import 'package:ecommerce_app/screens/carts/carts.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:ecommerce_app/state/model/model.dart';
import 'package:ecommerce_app/state/model/search_items_model.dart';
import 'package:ecommerce_app/state/actions/searched_item_action.dart';
import 'package:ecommerce_app/state/reducers/root_reducer.dart';
import 'package:ecommerce_app/screens/products/allproducts/allproducts.dart';
import 'package:ecommerce_app/screens/products/singleproducts/singleproduct.dart';
import 'package:ecommerce_app/screens/products/allproducts/routeargument.dart';
import 'package:ecommerce_app/widgets/common/appBar/search_appbar.dart';
import 'package:ecommerce_app/widgets/common/search_widget/search_widget.dart';
import 'package:ecommerce_app/helpers/helpers.dart';
import 'package:ecommerce_app/screens/carts/process.dart';
import 'package:ecommerce_app/state/actions/cart_actions.dart';
import 'package:ecommerce_app/state/model/cart_model.dart';

void main() {

  final store = Store<AppState>(appReducer,initialState:AppState.initialState());

  runApp(StoreProvider(store: store, child:  const Init()));
}

class Init extends StatelessWidget{

  const Init({super.key});

  @override 
  Widget build (BuildContext context){
    return MaterialApp(
      title: "ecommerce app",
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue
      ),
      // home: const MainScreen(),
      initialRoute:MainScreen.routeName,
      routes: {
        "/":(BuildContext context) =>const MainScreen(),
      },
      onGenerateRoute: (settings){
        if (settings.name == "/allproducts"){
          final  args = settings.arguments as RouteArgument;
          return MaterialPageRoute(builder:(context)=>AllProducts(allProducts:args.args,title:args.title,));
        }else if (settings.name == "/singleproduct"){
          final args = settings.arguments as Map<String,dynamic>;
          return MaterialPageRoute(builder:(context)=>SingleProduct(singleProduct:args));
        }
        assert(false,'need to implement ${settings.name}');
        return null;
      },
    );
  }
}

class MainScreen extends StatefulWidget{


  const MainScreen({Key?key}):super(key: key);

  static const routeName = "/";

  @override  
  State<MainScreen> createState ()=>_MainScreen();

  
}

class _MainScreen extends State<MainScreen>{

  int selectedIndex = 0;
  double headerSize = 100;
  List<Map<String,dynamic>> cartsContents =[];

  // bool showSearchWidget = false;

  static const List<Widget> widgetOptions = <Widget>[
    HomeScreen(),
    // ProfileScreen(),
    CartScreen()
  ];
    
  void selectTab(int index){
    setState(() {
      selectedIndex = index;
      if (index == 1){
        headerSize = 100;
      }
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   getCartsContents().then((value) =>{
  //     cartsContents = value
  //     // Store store = StoreProvider.of<AppState>(context)
  //   });
  // }

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

  Widget getWidget (bool showSearchWidget ,List<Map<String,dynamic>> searchedItems){
    Widget defaultWidget = widgetOptions.elementAt(selectedIndex);
    if (showSearchWidget){
      defaultWidget = SearchWidget(searchedItems:searchedItems,navigationController:navigationController);
    }
    return defaultWidget;
  }

  PreferredSizeWidget appBarWidget (bool showSearchWidget){
    PreferredSizeWidget defaultWidget = SearchAppBar(onSearch:onSearch,searchedKey:" ",onFocus:openSearchWidget);
    if (showSearchWidget){
      defaultWidget = BackIconSearchAppBar(
        onSearch: onSearch, 
        searchedKey:" ",
        onPressBack:closeSearchWidget,
        onFocus:openSearchWidget
      );
    } 
    return defaultWidget;
  }

  void initializeCartsContents (Store store){
      getCartsContents().then((value) =>{
          print(value),
          store.dispatch(CartListAction("CARTS_LIST",CartList(cartList:value)))
       });
  }

  @override
  Widget build(BuildContext context){
    return StoreConnector<AppState,AppState>(
      onInit:(store)=>{
        initializeCartsContents(store)
      },
      converter:(Store <AppState> store)=>store.state,
      builder:(BuildContext context,appState){
        return Scaffold(
          appBar:appBarWidget(appState.showSearchWidget?.showSearchWidget??false),
          body:Center(child:getWidget(appState.showSearchWidget?.showSearchWidget??false,appState.searchedItems?.searchedProducts??[])),
          bottomNavigationBar:BottomNavigationBar(
            backgroundColor:Colors.white,
            showSelectedLabels: false,
            showUnselectedLabels:false,
            iconSize:30,
            items:const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon:Icon(Icons.home),label:"Home"),
              // BottomNavigationBarItem(icon:Icon(Icons.person),label:"Profile"),
              BottomNavigationBarItem(icon:Icon(Icons.shopping_cart),label:"Cart"),
            ],
            currentIndex: selectedIndex,
            selectedItemColor: const Color(0xFF067f8f),
            onTap: selectTab,
          ),
        );
      }
    );
  }
}

