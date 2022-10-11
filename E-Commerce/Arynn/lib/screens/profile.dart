import 'package:flutter/material.dart';
import 'package:ecommerce_app/sampleData/data.dart';

class ProfileScreen extends StatefulWidget{

  const ProfileScreen({Key?key}):super(key: key);

  @override
  State<ProfileScreen> createState ()=>_ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen>{

  String wigdetType = "ALL_FEATURES";

  void changeWidget(String type){
    setState(() {
      wigdetType = type;
    });
  }

  @override
  Widget build(BuildContext context){
    if (wigdetType == "ALL_FEATURES"){
      return AllFeaturesProfile(setWidget:changeWidget);
    }else if (wigdetType == "ORDERS"){
      return const Text(
        "orders"
      );
    }else if (wigdetType == "ACCOUNT"){
      return const Text(
        "account"
      );
    }else if (wigdetType == "LIST"){
      return const Text(
        "list"
      );
    }else if (wigdetType == "BUYAGAIN"){
      return const Text(
        "buy again"
      );
    }
    return const Text("hahaha");
  
  }

}

// ignore:must_be_immutable
class AllFeaturesProfile extends StatelessWidget{

  Function  setWidget;

  static const buttons = [
    {"key":"orders","widget":"ORDERS"},
    {"key":"account","widget":"ACCOUNT"},
    {"key":"lists","widget":"LIST"},
    {"key":"buyagain","widget":"BUYAGAIN"}
  ];

  AllFeaturesProfile({Key?key,required this.setWidget}):super(key: key);

  Widget getWidget (context,List<Map<String,dynamic>> val){
    List<Widget> widgetList = [];
    for (Map<String,dynamic> content in val){
      widgetList.add(
        GestureDetector(
          child:Container(
            width: MediaQuery.of(context).size.width*0.4,
            height:50,
            margin: const EdgeInsets.only(right: 10,top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border:Border.all(color:const Color(0xFFbbbfbd),width: 1,style:BorderStyle.solid)
            ),
            alignment: Alignment.center,
            child:Text(content["key"])  ,
          ),
          onTap:(){
            setWidget(content["widget"]);
          },
        )
      );
    }
    return Wrap(children:widgetList);
  }

  Widget getWidgetBlock (context,Map<String,dynamic> map,List <Map<String,String>> val){
    String title = map["title"];
    String category = map["key"];
    // String displayName = map["displayName"];
    String displayName = map["products"][0]["productName"];
    Map<String,dynamic> content = map["products"][0];
    return Container(
            width:MediaQuery.of(context).size.width*0.8+5,
            margin: const EdgeInsets.only(top: 20),
            child:AllFeaturesProfileContentsSummary(content: content,title: title,displayName: displayName,category:category,setWidget:setWidget)
    );
  }

  Widget borderTop (context){
    return Container(
              width: MediaQuery.of(context).size.width,
              height:10,
              margin: const EdgeInsets.only(top:20),
              decoration: const BoxDecoration(color: Color(0xFFe1e6e2)),
            );
  }

  Widget buttonBlock (context,displayTitle,buttonText,key,List<Map<String,String>> buttonContents){

    void navigateToScreen(String type,List <Map<String,String>> buttonsList){
      for(Map<String,String> button in buttonsList){
        if (button.isNotEmpty && button["key"] == key){
          setWidget(button["widget"]);
          return;
        }
      }
    }

    return Container(
      width:MediaQuery.of(context).size.width*0.8,
      margin: const EdgeInsets.only(top:20),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Text(
            displayTitle,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 18
            )
          ),
          GestureDetector(
            child: Container(
                      margin: const EdgeInsets.only(top:10),
                      alignment: Alignment.center,
                      height:60,
                      decoration: BoxDecoration(border: Border.all(width: 1,color: const Color(0xFFbbbfbd),style: BorderStyle.solid),borderRadius:BorderRadius.circular(10)),
                      child: Text(buttonText),
            ),
            onTap: ()=>navigateToScreen(buttonText,buttons),
          )
        ]
      ),
    );
  }

  @override
  Widget build (BuildContext context){
    return Container(
      decoration: const BoxDecoration(color:Colors.white),
      child:  ListView(
        children: [
          Container(
            decoration: const BoxDecoration(color: Colors.white),
            padding: const EdgeInsets.only(bottom: 40),
            child:   Column(
                children: [
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF66e8d0),Color(0xFF66e4e8),Colors.white],
                        begin: Alignment.topCenter,
                        end:Alignment.bottomCenter
                      )
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Row(
                        children:const<Widget> [
                          Text(
                              "Hello ,Clement",
                                style: TextStyle(
                                  fontSize:20,
                                  color:Colors.black,
                                  fontWeight:FontWeight.bold
                                )
                          ),
                          Expanded(child: SizedBox())
                        ]
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child:Column(
                      children: [
                        getWidget(context,buttons),
                        getWidgetBlock(context,orders[0],buttons),
                        borderTop(context),
                        getWidgetBlock(context,lists[0],buttons),
                        borderTop(context),
                        buttonBlock(context,"Your Account","Visit your account","account",buttons),
                        borderTop(context),
                        buttonBlock(context,"Buy Again","Visit buy again","buyagain",buttons)
                        // buyAgainBlock(context)
                      ],
                    ),
                  ),
                ],
          ) ,
          ),
        ]
      ) ,
    ); 
  
  }
}

// ignore:must_be_immutable
class DisplayBlock extends StatelessWidget{

  Map<String,dynamic> content;
  String displayName;

  DisplayBlock({Key?key,required this.content,required this.displayName}):super(key: key);

  Widget showContents (){
    Widget returnedWidget = SizedBox(
      child: Column(children: <Widget>[
        const Text("Hi,you have no recent orders"),
        GestureDetector(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color:const Color(0xFFbbbfbd),width: 1,style:BorderStyle.solid),
              borderRadius: BorderRadius.circular(10)
            ),
            alignment: Alignment.center,
            child: const Text("Return to the Homepage"),
          ),
        )
      ]
      ),
    );
    if (content.isNotEmpty){
      returnedWidget = Column(
                          children: [
                                    GestureDetector(
                                      child:    Container(
                                          padding:const EdgeInsets.only(top: 20,bottom: 20,left:5,right: 5),
                                          decoration: BoxDecoration(
                                            border: Border.all(color: const Color(0xFFbbbfbd),width: 1,style:BorderStyle.solid),
                                            borderRadius: BorderRadius.circular(10)
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(child:  Text(displayName)
                                              ),
                                              Container(
                                                  width:60,
                                                  height: 60,
                                                  margin: const EdgeInsets.only(right:4),
                                                  decoration: BoxDecoration(color: const Color(0xFFbbbfbd),borderRadius:BorderRadius.circular(10))
                                              ),
                                                Container(
                                                  width:60,
                                                  height: 60,
                                                  padding: const EdgeInsets.all(10),
                                                  decoration: BoxDecoration(color: const Color(0xFFbbbfbd),borderRadius:BorderRadius.circular(10)),
                                                  child: Image.network(
                                                    content["productImage"],
                                                    width:20,
                                                    height: 20,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              
                                            ],
                                          ),
                                ) ,
                                    )
                                  
                          ],

      );
    }
    return returnedWidget;
  }

  @override
  Widget build (BuildContext context){
    return SizedBox(
      child: Column(
        children: [
          showContents()
        ]
      ),
    );
  }
}

// ignore:must_be_immutable
class AllFeaturesProfileContentsSummary extends StatelessWidget{

  Function setWidget;
  Map<String,dynamic> content;
  String displayName;
  String title;
  String category;


  AllFeaturesProfileContentsSummary({Key?key,required this.title,required this.displayName,required this.content,required this.setWidget,required this.category}):super(key: key);

  Widget getOrders (){
    return DisplayBlock(content: content, displayName: displayName);
  }

  void navigateToScreen (){
    if (category == "orders"){
      setWidget("ORDERS");
    }else if(category == "lists"){
      setWidget("LIST");
    }
  }

  Widget displayTitle (){
    return Row(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child:Text(
                        title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                  ) ,
              )
           ,
              const Expanded(child: SizedBox()),
              GestureDetector(
                child: const Text(
                    "See all",
                    style:TextStyle(color: Colors.lightBlue,fontSize:16)
                ),
                onTap:(){
                  navigateToScreen();
                },
              )
            ],
          );
  }

  @override
  Widget build (BuildContext context){
    return SizedBox(
      child: Column(
        children: [
          displayTitle(),
          getOrders()
        ]
      ),
    );
  }
}



class InfoButton extends StatelessWidget{

  const InfoButton({Key?key}):super(key: key);

  @override 
  Widget build (BuildContext context){
    return SizedBox(
      child:Column(children: [
        Row(),
        Row()
      ]),
    );
  }
}

