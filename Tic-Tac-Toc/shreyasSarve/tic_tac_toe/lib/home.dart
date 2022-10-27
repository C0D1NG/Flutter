import 'package:flutter/material.dart';
import 'package:tic_tac_toe/statics.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int turn = 1;
  String error = '';
  int won = 0;
  final List<List<int>> grid = [
    [0, 0, 0],
    [0, 0, 0],
    [0, 0, 0],
  ];
  final tics = const [
    Icon(
      player1,
      color: Colors.green,
      size: 50,
    ),
    Icon(
      player2,
      color: Colors.red,
      size: 50,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TicTacToe'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: Text(
              'Player $turn \'s turn ',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  if (won != 0) return;
                  final res = checkValidity(index);
                  if (!res) {
                    setState(() {
                      error = 'Invalid Move';
                    });
                    return;
                  }
                  setState(() {
                    grid[index ~/ 3][index % 3] = turn;
                    toggleTurn();
                  });
                  int winner = checkForWin();
                  if (winner != 0) {
                    setState(() {
                      won = winner;
                    });
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: grid[index ~/ 3][index % 3] == 0
                      ? const Text('')
                      : tics[grid[index ~/ 3][index % 3] - 1],
                ),
              );
            },
            itemCount: 9,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Text(
              'Player $won won',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                turn = 1;
                error = '';
                won = 0;
                for (int i = 0; i < 3; i++) {
                  for (int j = 0; j < 3; j++) {
                    grid[i][j] = 0;
                  }
                }
              });
            },
            icon: const Icon(
              Icons.restore_sharp,
              color: Colors.black,
              size: 30,
            ),
          )
        ],
      ),
    );
  }

  toggleTurn() {
    if (turn == 1) {
      setState(() {
        turn = 2;
      });
    } else {
      setState(() {
        turn = 1;
      });
    }
  }

  bool checkValidity(int index) {
    int row = index ~/ 3;
    int col = index % 3;
    if (grid[row][col] == 0) {
      return true;
    }
    return false;
  }

  int checkForWin() {
    for (int i = 0; i < 3; i++) {
      if (grid[i][0] == grid[i][1] &&
          grid[i][1] == grid[i][2] &&
          grid[i][0] != 0) {
        return grid[i][0];
      }
    }
    for (int i = 0; i < 3; i++) {
      if (grid[0][i] == grid[1][i] &&
          grid[1][i] == grid[2][i] &&
          grid[0][i] != 0) {
        return grid[0][i];
      }
    }
    if (grid[0][0] == grid[1][1] &&
        grid[1][1] == grid[2][2] &&
        grid[0][0] != 0) {
      return grid[0][0];
    }
    if (grid[0][2] == grid[1][1] &&
        grid[1][1] == grid[2][0] &&
        grid[0][2] != 0) {
      return grid[0][2];
    }
    return 0;
  }
}
