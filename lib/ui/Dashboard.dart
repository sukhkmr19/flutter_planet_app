import 'package:flutter/material.dart';

import 'roundValues.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _weightController = new TextEditingController();
  int groupValues = 0;
  double _finalWeight = 0.0;
  String _planetName = 'Pluto';

  void onRadioButtonChanged(int value) {
    setState(() {
      groupValues = value;
      _planetName = planetName(value);
      switch (value) {
        case 0:
          _finalWeight =
              calculateFinalWeightOnPlanet(_weightController.text, 0.06);
          break;
        case 1:
          _finalWeight =
              calculateFinalWeightOnPlanet(_weightController.text, 0.38);
          break;
        case 2:
          _finalWeight =
              calculateFinalWeightOnPlanet(_weightController.text, 0.91);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        padding: const EdgeInsets.all(10.0),
        child: new ListView(
          children: <Widget>[
            new Image.asset(
              'images/saturn.png',
              height: 133.0,
              width: 180.0,
            ),
            new Container(
              margin: EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: 'your weight on earth',
                      hintText: 'In lbs',
                      icon: new Icon(Icons.person),
                    ),
                  )
                ],
              ),
            ),
            new Padding(padding: new EdgeInsets.all(5.0)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Radio<int>(
                    activeColor: Colors.brown,
                    value: 0,
                    groupValue: groupValues,
                    onChanged: onRadioButtonChanged),
                new Text(
                  'Pluto',
                  style: new TextStyle(color: Colors.white30),
                ),
                new Radio<int>(
                    activeColor: Colors.red,
                    value: 1,
                    groupValue: groupValues,
                    onChanged: onRadioButtonChanged),
                new Text(
                  'Mars',
                  style: new TextStyle(color: Colors.white30),
                ),
                new Radio<int>(
                    activeColor: Colors.orangeAccent,
                    value: 2,
                    groupValue: groupValues,
                    onChanged: onRadioButtonChanged),
                new Text(
                  'Venus',
                  style: new TextStyle(color: Colors.white30),
                ),
              ],
            ),
            new Padding(padding: EdgeInsets.all(16.0)),
            new Center(
              child: new Text(
                'Your weight on $_planetName is $_finalWeight lbs.',
                style: new TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 19.5),
              ),
            )
          ],
        ),
      ),
    );
  }

  String planetName(int value) {
    switch (value) {
      case 0:
        return 'Pluto';
      case 1:
        return 'Mars';
      case 2:
        return 'Venus';
    }
  }

  double calculateFinalWeightOnPlanet(String weight, double multiplier) {
    if (weight.isNotEmpty && int.parse(weight) > 0) {
      return round(int.parse(weight) * multiplier, 2);
    } else {
      print('error!');
      return int.parse('120') * 0.38;
    }
  }
}
