import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ponderal Index Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          title: Text(
            "Welcome",
            style:
            TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: mainColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Text(
                "Ponderal Index Calculator",
                style: TextStyle(
                    fontSize: 47,
                    fontWeight: FontWeight.bold,
                    color: secondaryColor),
                  textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 80,
              ),
              GestureDetector(
                onTapDown: (TapDownDetails details){
                  setState(() {
                    buttonColorStart = Colors.white;
                  });
                },
                onTapCancel: (){
                  setState(() {
                    buttonColorStart = Colors.black;
                  });
                },
                onTap: () {
                  setState(() {
                    buttonColorStart = Colors.black;
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PonderalScreen(),
                      ));
                },
                child: Container(
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: buttonColorStart),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              GestureDetector(
                onTapDown: (TapDownDetails details){
                  setState(() {
                    buttonColorAbout = Colors.white;
                  });
                },
                onTapCancel: (){
                  setState(() {
                    buttonColorAbout = Colors.black;
                  });
                },
                onTap: () {
                  setState(() {
                    buttonColorAbout = Colors.black;
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AboutScreen(),
                      ));
                },
                child: Container(
                  child: Text(
                    "About",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: buttonColorAbout),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
              ),
              RightDecoration(
                decorationWidth: 80,
              ),
              SizedBox(
                height: 20,
              ),
              LeftDecoration(decorationWidth: 80),
              SizedBox(
                height: 20,
              ),
              RightDecoration(
                decorationWidth: 120,
              ),
              SizedBox(
                height: 20,
              ),
              LeftDecoration(decorationWidth: 120),
              SizedBox(
                height: 20,
              ),
              RightDecoration(decorationWidth: 80),
              SizedBox(
                height: 20,
              ),
              LeftDecoration(decorationWidth: 80),
            ],
          ),
        ));
  }
}

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          title: Text(
            "About",
            style:
            TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: mainColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Text(
                  "The Ponderal Index is an alternative to BMI (Body Mass Index) that measures body composition.",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: secondaryColor),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Text(
                  "Ponderal Index Formula:\nWeight in kg / (Height in m)^3",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: secondaryColor),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Text(
                  "Results Chart (using PI value)\nUnderweight: Below 11\nNormal Weight: Between 11 and 15\nOverweight: Between 15 and 17\nObese: Above 17",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: secondaryColor),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Text(
                  "A mobile application developed in Flutter by Ryan Yan",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: secondaryColor),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              RightDecoration(
                decorationWidth: 140,
              ),
              SizedBox(
                height: 20,
              ),
              LeftDecoration(decorationWidth: 60),
              SizedBox(
                height: 20,
              ),
              RightDecoration(
                decorationWidth: 100,
              ),
              SizedBox(
                height: 20,
              ),
              LeftDecoration(decorationWidth: 100),
              SizedBox(
                height: 20,
              ),
              RightDecoration(decorationWidth: 60),
              SizedBox(
                height: 20,
              ),
              LeftDecoration(decorationWidth: 140),
            ],
          ),
        ));
  }
}

class PonderalScreen extends StatefulWidget {
  @override
  _PonderalScreenState createState() => _PonderalScreenState();
}

class _PonderalScreenState extends State<PonderalScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _ponderalResult = 0;
  String _textResult = "Enter inputs and tap \"Calculate\"";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          title: Text(
            "Ponderal Index Calculator",
            style:
            TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: mainColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Height (m)",
                    textAlign: TextAlign.center,
                    style:
                    TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Weight (kg)",
                    textAlign: TextAlign.center,
                    style:
                    TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 130,
                    child: TextField(
                      cursorColor: Colors.black,
                      controller: _heightController,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: secondaryColor),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Ex: 1.82",
                        hintStyle: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.8)),
                      ),
                    ),
                  ),
                  Container(
                    width: 130,
                    child: TextField(
                      cursorColor: Colors.black,
                      controller: _weightController,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: secondaryColor),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Ex: 68.04",
                        hintStyle: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.8)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTapDown: (TapDownDetails details){
                  setState(() {
                    buttonColorCalculate = Colors.white;
                  });
                },
                onTapCancel: (){
                  setState(() {
                    buttonColorCalculate = Colors.black;
                  });
                },
                onTap: () {
                  try {
                    double _h = double.parse(_heightController.text);
                    double _w = double.parse(_weightController.text);
                    setState(() {
                      _ponderalResult = _w / (_h * _h * _h);
                      if(_ponderalResult > 17){
                        _textResult = "Result:\nObese";
                      } else if(_ponderalResult > 15 && _ponderalResult <= 17){
                        _textResult = "Result:\nOverweight";
                      } else if(_ponderalResult >= 11 && _ponderalResult <= 15){
                        _textResult = "Result:\nNormal weight";
                      }else{
                        _textResult = "Result:\nUnderweight";
                      }
                    });
                  } on FormatException catch(e) {
                    setState(() {
                        _textResult = "Please input valid number values!";
                    });
                  }
                  setState(() {
                    buttonColorCalculate = Colors.black;
                  });
                },
                child: Container(
                  child: Text(
                    "Calculate",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: buttonColorCalculate),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Ponderal Index Value",
                style: TextStyle(fontSize: 30, color: secondaryColor),
              ),
              Container(
                child: Text(
                  _ponderalResult.toStringAsFixed(2),
                  style: TextStyle(fontSize: 60, color: secondaryColor),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Visibility(
                  visible: _textResult.isNotEmpty,
                  child: Container(
                    child: Text(
                      _textResult,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w400,
                          color: secondaryColor),
                    ),
                  )),
              SizedBox(
                height: 45,
              ),
              RightDecoration(
                decorationWidth: 40,
              ),
              SizedBox(
                height: 20,
              ),
              LeftDecoration(decorationWidth: 60),
              SizedBox(
                height: 20,
              ),
              RightDecoration(
                decorationWidth: 80,
              ),
              SizedBox(
                height: 20,
              ),
              LeftDecoration(decorationWidth: 100),
              SizedBox(
                height: 20,
              ),
              RightDecoration(decorationWidth: 120),
              SizedBox(
                height: 20,
              ),
              LeftDecoration(decorationWidth: 140),
            ],
          ),
        ));
  }
}

class RightDecoration extends StatelessWidget {
  final double decorationWidth;

  const RightDecoration({Key key, @required this.decorationWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 25,
          width: decorationWidth,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(7),
                bottomLeft: Radius.circular(7),
              ),
              color: secondaryColor),
        ),
      ],
    );
  }
}

class LeftDecoration extends StatelessWidget {
  final double decorationWidth;

  const LeftDecoration({Key key, @required this.decorationWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 25,
          width: decorationWidth,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(7),
                bottomRight: Radius.circular(7),
              ),
              color: secondaryColor),
        ),
      ],
    );
  }
}

final Color mainColor = Colors.lightBlueAccent;
final Color secondaryColor = Colors.black;
Color buttonColorStart = Colors.black;
Color buttonColorAbout = Colors.black;
Color buttonColorCalculate = Colors.black;