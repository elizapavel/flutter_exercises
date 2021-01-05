import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Random rand = Random();

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
  int _goalNumber = rand.nextInt(100);
  String _guessResult = '';
  String _triedNumber = '';
  bool _showResetButton = false;

  Widget guessButton() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: RaisedButton(
        onPressed: () {
          final int triedNumber = int.parse(_triedNumber);
          if (triedNumber < _goalNumber) {
            _guessResult = 'Try higher!';
          } else if (triedNumber > _goalNumber) {
            _guessResult = 'Try lower!';
          } else {
            _guessResult = 'You guessed right!';
            _showDialog();
          }
          setState(() {});
        },
        child: const Text('Guess'),
      ),
    );
  }

  Widget resetButton() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: RaisedButton(
        onPressed: () {
          reset();
        },
        child: const Text('Reset'),
      ),
    );
  }

  void _showDialog() {
    showDialog<AlertDialog>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('You guessed right!'),
          content: Text('It was $_triedNumber'),
          actions: <FlatButton>[
            FlatButton(
              child: const Text('Try again!'),
              onPressed: () {
                reset();
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                _showResetButton = true;
                setState(() {});
              },
            ),
          ],
        );
      },
    );
  }

  void reset() {
    _showResetButton = false;
    _goalNumber = rand.nextInt(100);
    _triedNumber = '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          child: Text('Guess my number'),
        ),
      ),
      body: Column(
        children: <Widget>[
          const Align(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "I'm thinking of a number between 1 and 100.",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Align(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "It's your turn to guess my number!",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          if (_triedNumber.isNotEmpty)
            Align(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'You tried $_triedNumber \n$_guessResult',
                  style: const TextStyle(
                    fontSize: 34,
                    color: Colors.black38,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          Align(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                child: Column(
                  children: <Widget>[
                    const Align(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Try a number!',
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onChanged: (String value) {
                          _triedNumber = value;
                        },
                        readOnly: _showResetButton,
                      ),
                    ),
                    if (_showResetButton) resetButton() else guessButton()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
