import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const Color _defaultColor = Colors.white;

  final List<Color> _allSquares = <Color>[
    _defaultColor,
    _defaultColor,
    _defaultColor,
    _defaultColor,
    _defaultColor,
    _defaultColor,
    _defaultColor,
    _defaultColor,
    _defaultColor
  ];

  final List<Color> _colors = <Color>[Colors.red, Colors.green];
  String _result = '';
  int _nextColorIndex = 0;
  int _movesLeft = 9;
  int _redScore = 0;
  int _greenScore = 0;

  bool _currentPlayerWon(int i) {
    final List<int> mainDiagIndexes = <int>[0, 4, 8];
    final List<int> counterDiagIndexes = <int>[2, 4, 6];
    final int _row = (i / 3).floor();
    final int _col = i % 3;

    // check horizontal line
    final int _index = _row * 3;
    if (_allSquares[_index] == _allSquares[_index + 1] && _allSquares[_index + 1] == _allSquares[_index + 2]) {
      return true;
    }

    // check vertical line
    if (_allSquares[_col] == _allSquares[_col + 3] && _allSquares[_col + 3] == _allSquares[_col + 6]) {
      return true;
    }

    // check main diagonal
    if (mainDiagIndexes.contains(i) &&
        _allSquares[mainDiagIndexes[0]] == _allSquares[mainDiagIndexes[1]] &&
        _allSquares[mainDiagIndexes[1]] == _allSquares[mainDiagIndexes[2]]) {
      return true;
    }

    // check counter diagonal
    if (counterDiagIndexes.contains(i) &&
        _allSquares[counterDiagIndexes[0]] == _allSquares[counterDiagIndexes[1]] &&
        _allSquares[counterDiagIndexes[1]] == _allSquares[counterDiagIndexes[2]]) {
      return true;
    }

    return false;
  }

  void _showDialog() {
    showDialog<AlertDialog>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(_result),
          actions: <FlatButton>[
            FlatButton(
              child: const Text('Try again'),
              onPressed: () {
                _resetMatch();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _resetGame() {
    setState(
      () {
        for (int i = 0; i < 9; i++) {
          _allSquares[i] = _defaultColor;
        }

        _result = '';
        _nextColorIndex = 0;
        _movesLeft = 9;
        _redScore = 0;
        _greenScore = 0;
      },
    );
  }

  void _resetMatch() {
    setState(
      () {
        for (int i = 0; i < 9; i++) {
          _allSquares[i] = _defaultColor;
        }

        _result = '';
        _nextColorIndex = 0;
        _movesLeft = 9;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          child: Text('tic-tac-toe'),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'RED Score: $_redScore',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'GREEN Score: $_greenScore',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              'The next player is: ' + (_nextColorIndex == 0 ? 'RED' : 'GREEN'),
              style: const TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: 9,
              padding: const EdgeInsets.all(5.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return FlatButton(
                  onPressed: () {
                    if (_movesLeft > 0 && _allSquares[index] == _defaultColor) {
                      setState(
                        () {
                          _allSquares[index] = _colors[_nextColorIndex];
                          if (_currentPlayerWon(index)) {
                            _result = 'The winner is ' + (_nextColorIndex == 0 ? 'RED' : 'GREEN');

                            _redScore += 1 - _nextColorIndex;
                            _greenScore += _nextColorIndex;
                            _movesLeft = 0;

                            _showDialog();
                          } else if (_movesLeft == 1) {
                            _result = "It's a DRAW!";
                            _showDialog();
                          } else {
                            _nextColorIndex = 1 - _nextColorIndex;
                            _movesLeft--;
                          }
                        },
                      );
                    }
                  },
                  padding: const EdgeInsets.all(0),
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.ease,
                    decoration: BoxDecoration(
                      color: _allSquares[index],
                      border: Border.all(color: Colors.black54),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    _resetGame();
                  },
                  child: const Text(
                    'Reset Game',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _resetMatch();
                  },
                  child: const Text(
                    'Try Again',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
