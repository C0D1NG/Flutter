
import 'package:flutter/material.dart';

Widget searchBarWidget (BuildContext context,double width,bool showFocusedBorder,bool showInputBorder,Function onSearch,Function onfocus){
    // TextEditingController inputController = TextEditingController(text:" ");
    Widget searchBar = SizedBox(
          width:width,
          height: 50,
          child: TextField(
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius:BorderRadius.circular(10),
                borderSide: BorderSide(color:showInputBorder ? Colors.grey:Colors.transparent),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius:BorderRadius.circular(10),
                borderSide: BorderSide(color:showFocusedBorder ?Colors.grey:Colors.transparent),
              ),
              fillColor: Colors.white,
              hintText: "search item",
              prefixIcon:IconButton(onPressed:()=>{}, icon:const Icon(Icons.search,color:Colors.grey,)) ,
            ),
            onTap:()=>onfocus(context),
            // controller:inputController,
            onChanged:(text)=>onSearch(context,text),
            // onEditingComplete:()=>onSearch(inputController.value),
          ),
    );
    return searchBar;
  }

//ignore:must_be_immutable
class SearchAppBar extends StatelessWidget implements PreferredSizeWidget{

  final double headerSize;
  final List<Color> backgroundColor;
  String searchedKey;
  Function onSearch;
  Function? onFocus;
  final double marginTop;
  final bool showInputBorder;
  final String searchBarAlignment;
  final bool showFocusedBorder;

  SearchAppBar({
    Key?key,
    this.headerSize=100,
    this.backgroundColor = const [Color(0xFF66e4e8),Color(0xFF66e8d0)],
    this.marginTop=10,
    this.showInputBorder=true,
    this.searchBarAlignment = "bottom",
    this.showFocusedBorder = false,
    required this.onSearch,
    required this.searchedKey,
    this.onFocus,
  }):super(key:key);

  @override
  Size get preferredSize =>Size.fromHeight(headerSize);

  Alignment getAlignment(){
    Alignment defaultAlignment = Alignment.bottomCenter;
    if (searchBarAlignment == "center"){
      defaultAlignment = Alignment.center;
    }else if (searchBarAlignment == "top"){
      defaultAlignment = Alignment.topCenter;
    }
    return defaultAlignment;
  }

  @override
  Widget build (BuildContext context){
    return Container(
        alignment:getAlignment(),
        padding: const EdgeInsets.only(top: 10,bottom: 10),
        decoration: BoxDecoration(
          gradient:LinearGradient (
              colors: [backgroundColor[0],backgroundColor[1]],
              begin:Alignment.centerLeft,
              end: Alignment.centerRight
          )
        ),
        height:headerSize,
        child:searchBarWidget(context,300,showFocusedBorder,showInputBorder,onSearch,onFocus??()=>{})
    );
  }
  
}

//ignore:must_be_immutable
class BackIconSearchAppBar extends StatelessWidget implements PreferredSizeWidget{

  final double headerSize;
  final List<Color> backgroundColor;
  String searchedKey;
  Function onSearch;
  Function? onFocus;
   Function onPressBack;
  final double marginTop;
  final bool showInputBorder;
  final String searchBarAlignment;
  final bool showFocusedBorder;

  BackIconSearchAppBar({
    Key?key,
    this.headerSize=100,
    this.backgroundColor = const [Color(0xFF66e4e8),Color(0xFF66e8d0)],
    this.marginTop=10,
    this.showInputBorder=true,
    this.searchBarAlignment = "bottom",
    this.showFocusedBorder = false,
    required this.onSearch,
    required this.searchedKey,
    required this.onPressBack,
    this.onFocus
  }):super(key:key);

  Alignment getAlignment(){
    Alignment defaultAlignment = Alignment.bottomCenter;
    if (searchBarAlignment == "center"){
      defaultAlignment = Alignment.center;
    }else if (searchBarAlignment == "top"){
      defaultAlignment = Alignment.topCenter;
    }
    return defaultAlignment;
  }

  MainAxisAlignment getMainAxisAlignment(){
    MainAxisAlignment defaultMainAxis = MainAxisAlignment.center;
    if (searchBarAlignment == "center"){
      defaultMainAxis = MainAxisAlignment.center;
    }else if (searchBarAlignment == "top"){
      defaultMainAxis = MainAxisAlignment.center;
    }
    return defaultMainAxis;
  } 

  CrossAxisAlignment getCrossxisAlignment(){
    CrossAxisAlignment defaultCrossAxis = CrossAxisAlignment.end;
    if (searchBarAlignment == "center"){
      defaultCrossAxis = CrossAxisAlignment.center;
    }else if (searchBarAlignment == "top"){
      defaultCrossAxis = CrossAxisAlignment.start;
    }
    return defaultCrossAxis;
  } 

  @override
  Size get preferredSize => Size.fromHeight(headerSize);

  @override
  Widget build (BuildContext context){
    return Container(
        alignment:getAlignment(),
        padding: const EdgeInsets.only(top: 10,bottom: 10),
        decoration: BoxDecoration(
          gradient:LinearGradient (
              colors: [backgroundColor[0],backgroundColor[1]],
              begin:Alignment.centerLeft,
              end: Alignment.centerRight
          )
        ),
        height:headerSize,
        child:Row(
        mainAxisAlignment:getMainAxisAlignment(),
        crossAxisAlignment:getCrossxisAlignment(),
        children: [
            Container(
              alignment:Alignment.center,
              height:50,
              child:Container(
                alignment:Alignment.center,
                margin:const EdgeInsets.only(left:20,right:20),
                width:40,
                height:40,
                decoration:BoxDecoration(color:const Color(0xFFdce0de),borderRadius:BorderRadius.circular(40)),
                child:IconButton(
                  highlightColor:Colors.transparent,
                  icon:const Icon(Icons.arrow_back,color:Colors.black),
                  onPressed: ()=>onPressBack(context),
                ),
              ), 
            ),
            Expanded(child:searchBarWidget(context,150,showFocusedBorder,showInputBorder,onSearch,onFocus??()=>{})),
            const SizedBox(width:30,)
        ],
      )
    );
  }
}