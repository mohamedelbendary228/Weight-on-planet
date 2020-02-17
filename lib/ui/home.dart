import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
/*
  Mercury: 0.38
  Venus: 0.91
  Earth: 1.00
  Mars: 0.38
  Jupiter: 2.34
  Saturn: 1.06
  Uranus: 0.92
  Neptune: 1.19
  Pluto: 0.06
  weight = mass x multiplier (surface gravity)
 */
  final TextEditingController _weightController = new TextEditingController();
  int radioValue = 0;
  double _finalResults = 0.0;
  String _formatedText = "";


  void radioValueChange(int value) {
    setState(() {
      radioValue = value;

      switch(radioValue){
        case 0:
          _finalResults = calculateWeight(_weightController.text, 0.06);
          _formatedText = " Your weight on pluto is $_finalResults";
          break;
        case 1:
          _finalResults = calculateWeight(_weightController.text, 0.38);
          _formatedText = " Your weight on Mars is $_finalResults";
          break;
        case 2:
          _finalResults = calculateWeight(_weightController.text, 0.91);
          _formatedText = " Your weight on Venus is $_finalResults";

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Weight On Planet X"),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      //body
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            Image.asset(
              "images/planet.png",
              height: 165.0,
              width: 250.0,
            ),
            new Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(3.0),
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Your Weight on Earth",
                        hintText: "In Pounds",
                        icon: new Icon(Icons.person)),
                  ),
                  new Padding(padding: EdgeInsets.all(8.0)),
                  // add three radio buttons
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio<int>(
                        activeColor: Colors.brown,
                          value: 0,
                          groupValue: radioValue,
                          onChanged: radioValueChange),
                      new Text("Pluto", style: new TextStyle(color: Colors.white30),),
                      new Radio<int>(
                        activeColor: Colors.red,
                          value: 1,
                          groupValue: radioValue,
                          onChanged: radioValueChange),
                      new Text("Mars", style: new TextStyle(color: Colors.white30),),

                      new Radio<int>(
                        activeColor: Colors.orangeAccent,
                          value: 2,
                          groupValue: radioValue,
                          onChanged: radioValueChange),
                      new Text("Venus", style: new TextStyle(color: Colors.white30),),
                    ],
                  ),
                  new Padding(padding: EdgeInsets.all(16.5)),
                  new Text( _weightController.text.isEmpty? "Plaese enter weight" :
                    "$_formatedText lbs",
                  style: new TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                  ),)

                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double calculateWeight(String weight, double multiplier) {
    if(int.parse(weight).toString().isNotEmpty && int.parse(weight)>0){
      return int.parse(weight) * multiplier;
    }else {
      return int.parse("153") * 0.3;
    }

  }
}
