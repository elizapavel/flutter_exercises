import 'package:http/http.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> main() async {
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
  List<Map<String, String>> _data = <Map<String, String>>[];

  Future<void> _getData() async {
    final List<Map<String, String>> listData = <Map<String, String>>[];
    final Response response = await get('https://www.worldometers.info/geography/flags-of-the-world/');
    final String data = response.body;

    final List<String> items = data.split('<a href="/img/flags');
    for (final String item in items.skip(1)) {
      const String pattern = 'padding-top:10px">';
      final String countryName = item.substring(item.indexOf(pattern) + pattern.length, item.indexOf('</div>'));
      final String flagUrl = 'https://www.worldometers.info/img/flags${item.split('"')[0]}';

      listData.add(<String, String>{countryName: flagUrl});
    }

    setState(() {
      _data = listData;
    });
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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
        itemCount: _data.length,
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 25.0,
          mainAxisSpacing: 25.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  _launchURL(_data[index].values.first);
                },
                child: Image.network(
                  _data[index].values.first,
                  height: 100,
                ),
              ),
              Text(_data[index].keys.first),
            ],
          );
        },
      ),
    );
  }
}
