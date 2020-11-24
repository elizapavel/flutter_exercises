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
  final String _defaultErrorMessage = 'The inserted amount is not valid. Please use only digits and \'.\'';
  final double _ronPerEuro = 4.87;
  String _enteredValue = '';
  double _finalValue = 0;
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Align(
        child: Text('Currency Converter'),
      )),
      body: Column(
        children: <Widget>[
          Align(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.network(
                'https://cdn3.iconfinder.com/data/icons/gradient-1/50/79-512.png',
                height: 100,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
              // better make the validation manual, so that the user has feedback
              // when something is not right
              // inputFormatters: <TextInputFormatter>[
              //   FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d?\d?)')),
              // ],
              onChanged: (String value) {
                _enteredValue = value;
                if (value == null || double.tryParse(value) == null) {
                  _errorMessage = _defaultErrorMessage;
                } else {
                  _errorMessage = null;
                }
              },
              decoration: InputDecoration(
                hintText: 'Amount',
                errorText: _errorMessage,
                suffixText: '€',
              ),
            ),
          ),
          ElevatedButton(
            child: const Text('Convert'),
            onPressed: () {
              setState(() {
                if (_enteredValue != null && _enteredValue.isNotEmpty && double.tryParse(_enteredValue) != null) {
                  _finalValue = double.parse(_enteredValue) * _ronPerEuro;
                  _errorMessage = null;
                } else {
                  _errorMessage = _defaultErrorMessage;
                }
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              _enteredValue != null && _enteredValue.isNotEmpty && double.tryParse(_enteredValue) != null
                  ? _finalValue.toString() + ' LEI'
                  : '',
              style: const TextStyle(
                fontSize: 24,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
