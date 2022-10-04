import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var player=1;
  var clicks=0;
  bool matchEnd=false;
  var winner=0;
  List<List<int>> places=[[0,0,0],[0,0,0],[0,0,0]];

  int checkWinner(){
    print(places[0]);
    if(places[0][0]==1 && places[0][1]==1 && places[0][2]==1){
      return 1;
    }
    else if(places[0][0]==2 && places[0][1]==2 && places[0][2]==2){
      return 2;
    }
    else if(places[1][0]==1 && places[1][1]==1 && places[1][2]==1){
      return 1;
    }
    else if(places[1][0]==2 && places[1][1]==2 && places[1][2]==2){
      return 2;
    }
    else if(places[2][0]==1 && places[2][1]==1 && places[2][2]==1){
      return 1;
    }
    else if(places[2][0]==2 && places[2][1]==2 && places[2][2]==2){
      return 2;
    }
    else if(places[0][0]==1 && places[1][0]==1 && places[2][0]==1){
      return 1;
    }
    else if(places[0][0]==2 && places[1][0]==2 && places[2][0]==2){
      return 2;
    }
    else if(places[0][1]==1 && places[1][1]==1 && places[2][1]==1){
      return 1;
    }
    else if(places[0][1]==2 && places[1][1]==2 && places[2][1]==2){
      return 2;
    }
    else if(places[0][2]==1 && places[1][2]==1 && places[2][2]==1){
      return 1;
    }
    else if(places[0][2]==2 && places[1][2]==2 && places[2][2]==2){
      return 2;
    }
    else if(places[0][0]==1 && places[1][1]==1 && places[2][2]==1){
      return 1;
    }
    else if(places[0][0]==2 && places[1][1]==2 && places[2][2]==2){
      return 2;
    }
    else if(places[0][2]==1 && places[1][1]==1 && places[2][0]==1){
      return 1;
    }
    else if(places[0][2]==2 && places[1][1]==2 && places[2][0]==2){
      return 2;
    }
    if(clicks==9) return 3;
    return 0;
  }

  void handleClick(int r,int c){
    if(matchEnd==true) return;
    if(places[r][c]==0){
      setState(() {
        places[r][c]=player;
        player=player==1 ? 2 : 1;
        int res = checkWinner();
        if(res>0) matchEnd=true;
        if(res==1){
          winner=1;
        }
        else if(res==2){
          winner=2;
        }
        else if(res==3){
          winner=3;
        }
        else{
          winner=0;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final boxDimension = (screenWidth-48)/3;
    return Scaffold(
      appBar: AppBar(title: const Text("Tic Tac Toe")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: screenWidth,
            padding: const EdgeInsets.symmetric(vertical: 16),
            alignment: Alignment.center,
            child: Text(
                "Turn: Player ${player}",
              style: TextStyle(
                  fontSize: screenWidth*0.08
              ),
            ),
          ),
          Container(
            color: Colors.black,
            width: screenWidth-16,
            height: screenWidth-16,
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => handleClick(0,0),
                      child: Container(
                          height: boxDimension,
                          width: boxDimension,
                          color: Colors.white,
                          child: Center(
                              child: Text(
                                places[0][0]==0 ? "" : places[0][0]==1? "X" : "O",
                                style: TextStyle(
                                    fontSize: screenWidth*0.13
                                ),
                              )
                          )
                      ),
                    ),
                    GestureDetector(
                      onTap: () => handleClick(0,1),
                      child: Container(
                          height: boxDimension,
                          width: boxDimension,
                          color: Colors.white,
                          child: Center(
                              child: Text(
                                places[0][1]==0 ? "" : places[0][1]==1? "X" : "O",
                                style: TextStyle(
                                    fontSize: screenWidth*0.13
                                ),
                              )
                          )
                      ),
                    ),
                    GestureDetector(
                      onTap: () => handleClick(0,2),
                      child: Container(
                          height: boxDimension,
                          width: boxDimension,
                          color: Colors.white,
                          child: Center(
                              child: Text(
                                places[0][2]==0 ? "" : places[0][2]==1? "X" : "O",
                                style: TextStyle(
                                    fontSize: screenWidth*0.13
                                ),
                              )
                          )
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => handleClick(1,0),
                      child: Container(
                          height: boxDimension,
                          width: boxDimension,
                          color: Colors.white,
                          child: Center(
                              child: Text(
                                places[1][0]==0 ? "" : places[1][0]==1? "X" : "O",
                                style: TextStyle(
                                    fontSize: screenWidth*0.13
                                ),
                              )
                          )
                      ),
                    ),
                    GestureDetector(
                      onTap: () => handleClick(1,1),
                      child: Container(
                          height: boxDimension,
                          width: boxDimension,
                          color: Colors.white,
                          child: Center(
                              child: Text(
                                places[1][1]==0 ? "" : places[1][1]==1? "X" : "O",
                                style: TextStyle(
                                    fontSize: screenWidth*0.13
                                ),
                              )
                          )
                      ),
                    ),
                    GestureDetector(
                      onTap: () => handleClick(1,2),
                      child: Container(
                          height: boxDimension,
                          width: boxDimension,
                          color: Colors.white,
                          child: Center(
                              child: Text(
                                places[1][2]==0 ? "" : places[1][2]==1? "X" : "O",
                                style: TextStyle(
                                    fontSize: screenWidth*0.13
                                ),
                              )
                          )
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => handleClick(2,0),
                      child: Container(
                          height: boxDimension,
                          width: boxDimension,
                          color: Colors.white,
                          child: Center(
                              child: Text(
                                places[2][0]==0 ? "" : places[2][0]==1? "X" : "O",
                                style: TextStyle(
                                    fontSize: screenWidth*0.13
                                ),
                              )
                          )
                      ),
                    ),
                    GestureDetector(
                      onTap: () => handleClick(2,1),
                      child: Container(
                          height: boxDimension,
                          width: boxDimension,
                          color: Colors.white,
                          child: Center(
                              child: Text(
                                places[2][1]==0 ? "" : places[2][1]==1? "X" : "O",
                                style: TextStyle(
                                    fontSize: screenWidth*0.13
                                ),
                              )
                          )
                      ),
                    ),
                    GestureDetector(
                      onTap: () => handleClick(2,2),
                      child: Container(
                          height: boxDimension,
                          width: boxDimension,
                          color: Colors.white,
                          child: Center(
                              child: Text(
                                places[2][2]==0 ? "" : places[2][2]==1? "X" : "O",
                                style: TextStyle(
                                    fontSize: screenWidth*0.13
                                ),
                              )
                          )
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            width: screenWidth,
            padding: const EdgeInsets.symmetric(vertical: 16),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  winner==1 || winner==2 ? "Player ${winner} won!!" : winner==3 ? "Match ends in draw!!" : "",
                  style: TextStyle(
                      fontSize: screenWidth*0.06
                  ),
                ),
                ElevatedButton(
                    onPressed: (){
                      setState(() {
                        player=1;
                        winner=0;
                        places=[[0,0,0],[0,0,0],[0,0,0]];
                        matchEnd=false;
                      });
                    },
                    child: const Text("Restart Game")
                )
              ],
            )
          ),
        ],
      )
    );
  }
}
