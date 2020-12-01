import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  String _insertedNumber = '';
  String _result = '';

  bool _isSquare(int number) {
    return number > 0 && sqrt(number) % 1 == 0;
  }

  bool _isTriangular(int number) {
    return number > 0 &&
        num.parse(pow(number, 1 / 3).toStringAsFixed(3)) % 1 == 0;
  }

  void _showDialog() {
    showDialog<AlertDialog>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(_insertedNumber),
          content: Text(_result),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Align(
            child: Text('Number Shapes'),
          ),
        ),
        body: Column(
          children: <Widget>[
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Please input a number to see if it is square or triangular.',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                keyboardType: const TextInputType.numberWithOptions(
                    decimal: true, signed: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                onChanged: (String value) {
                  _insertedNumber = value;
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final int insertedNumber = int.parse(_insertedNumber);
            final bool isSquareCondition = _isSquare(insertedNumber);
            final bool isTriangularCondition = _isTriangular(insertedNumber);

            if (isSquareCondition && isTriangularCondition)
              _result =
              'Number $_insertedNumber is both SQUARE and TRIANGULAR.';
            else if (isSquareCondition)
              _result = 'Number $_insertedNumber is SQUARE.';
            else if (isTriangularCondition)
              _result = 'Number $_insertedNumber is TRIANGULAR.';
            else
              _result =
              'Number $_insertedNumber is neither TRIANGULAR or SQUARE.';

            _showDialog();
          },
          child: const Icon(
            Icons.check,
          ),
        ),
    );
  }
}