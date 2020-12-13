import 'package:audioplayers/audioplayers.dart';
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
  AudioPlayer player = AudioPlayer();

  final List<List<Map<String, String>>> _data = <List<Map<String, String>>>[
    <Map<String, String>>[
      <String, String>{'Salut (RO)': 'assets/sounds/salut(ro).mp3'},
      <String, String>{'Hello (EN)': 'assets/sounds/salut(en).mp3'}
    ],
    <Map<String, String>>[
      <String, String>{'Mă numesc (RO)': 'assets/sounds/ma_numesc(ro).mp3'},
      <String, String>{'My name is (EN)': 'assets/sounds/ma_numesc(en).mp3'}
    ],
    <Map<String, String>>[
      <String, String>{'Cum ești? (RO)': 'assets/sounds/cum_esti(ro).mp3'},
      <String, String>{'How are you? (EN)': 'assets/sounds/cum_esti(en).mp3'}
    ],
    <Map<String, String>>[
      <String, String>{'Sunt bine (RO)': 'assets/sounds/sunt_bine(ro).mp3'},
      <String, String>{"I'm fine (EN)": 'assets/sounds/sunt_bine(en).mp3'}
    ],
    <Map<String, String>>[
      <String, String>{'Mă bucur (RO)': 'assets/sounds/ma_bucur(ro).mp3'},
      <String, String>{"I'm glad (EN)": 'assets/sounds/ma_bucur(en).mp3'}
    ],
  ];

  void _play(String url) {
    player.play('assets/sounds/ma_bucur(en).mp3', isLocal: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          child: Text('Basic Phrases'),
        ),
      ),
      body: GridView.builder(
        itemCount: _data.length * 2,
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 25.0,
          mainAxisSpacing: 25.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return FlatButton(
            onPressed: () {},
            padding: const EdgeInsets.all(0),
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                FlatButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    _play(_data[index ~/ 2][index % 2].values.first);
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: <Color>[
                          Colors.blueAccent,
                          Colors.lightBlueAccent
                        ],
                      ),
                    ),
                  ),
                ),
                Text(
                  _data[index ~/ 2][index % 2].keys.first,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
