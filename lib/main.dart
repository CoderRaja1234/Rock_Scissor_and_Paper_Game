import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:async';

double width, height;
String userSelection = 'rock', botSelection = 'rock';
//visibility of gifs
bool rock = true, paper = true, scissors = true;
String res="Draw";

void main() {
  runApp(MaterialApp(
    home: Splash(),
  ));
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(
        Duration(milliseconds: 1000),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //rgb(250, 186, 87)
      backgroundColor: Colors.orange[300],
      body: Center(
        child: Image.asset('assets/home.gif'),
      ),
    );
  }
}

void calc(String userSelection) {
  int bot = Random().nextInt(3), userItem;

  if (bot == 0) botSelection = 'rock';
  if (bot == 1) botSelection = 'paper';
  if (bot == 2) botSelection = 'scissors';

  print("Bot selected $botSelection");
  //0 = rock, 1 = paper, 2 = scissors
  if (userSelection == 'rock') userItem = 0;
  if (userSelection == 'paper') userItem = 1;
  if (userSelection == 'scissors') userItem = 2;

  if (bot == userItem)
  {
    res="Draw";
    print("Draw");
  }
  else {
    if (userItem == 0) {
      if (bot == 1) {
        res="Lose";
        print("You lose!! $botSelection covers $userSelection");
      }
      if (bot == 2) {
        res="Win";
        print("You win!! $userSelection smashes $botSelection");
      }
    }

    if (userItem == 1) {
      if (bot == 0){
        res="Win";
        print("You win!! $userSelection covers $botSelection");
      }
      if (bot == 2){
        res="Lose";
        print("You lose!! $botSelection cut $userSelection");
      }
    }

    if (userItem == 2) {
      if (bot == 0){
        res="Lose";
        print("You lose!! $botSelection smashes $userSelection");
      }
      if (bot == 1){
        res="Win";
        print("You win!! $userSelection cut $botSelection");
      }
    }
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  bool firstLayerVisible = true;
  bool secondLayerVisible = false;
  bool userItem = false;
  bool botItem = false;

  AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 186, 87, 1),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.05,
          ),
          Text(
            'RockPaperScissors',
            style: TextStyle(fontFamily: 'KaushanScript', fontSize: 38),
          ),
          SizedBox(
            height: height * 0.2,
          ),
          Stack(children: [
            AnimatedOpacity(
              opacity: firstLayerVisible ? 1.0 : 0.0,
              duration: Duration(milliseconds: 500),
              child: Column(
                children: [
                  Text(
                    'SELECT',
                    style: TextStyle(fontFamily: 'KaushanScript', fontSize: 28),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            userSelection = 'rock';
                            calc(userSelection);
                            firstLayerVisible = false;
                            secondLayerVisible = true;
                            _animationController.forward();
                          });
                        },
                        child: Card(
                          elevation: 0,
                          color: Color.fromRGBO(250, 186, 87, 1),
                          child: Image.asset('assets/rock.gif',
                              height: height * 0.30, width: width / 4),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            userSelection = 'paper';
                            calc(userSelection);
                            firstLayerVisible = false;
                            secondLayerVisible = true;
                            _animationController.forward();
                          });
                        },
                        child: Card(
                          elevation: 0,
                          color: Color.fromRGBO(250, 186, 87, 1),
                          child: Image.asset('assets/paper.gif',
                              height: height * 0.30, width: width / 4),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            userSelection = 'scissors';
                            calc(userSelection);
                            firstLayerVisible = false;
                            secondLayerVisible = true;
                            _animationController.forward();
                          });
                        },
                        child: Card(
                          elevation: 0,
                          color: Color.fromRGBO(250, 186, 87, 1),
                          child: Image.asset('assets/scissors.gif',
                              height: height * 0.30, width: width / 4),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            AnimatedOpacity(
              opacity: secondLayerVisible ? 1.0 : 0.0,
              duration: Duration(milliseconds: 500),
              child: Column(
                children: [
                  Text(
                    res,
                    style: TextStyle(fontFamily: 'KaushanScript', fontSize: 28),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SlideTransition(
                        position:
                        Tween<Offset>(begin: Offset(-10, 0), end: Offset.zero)
                            .animate(_animationController),
                        child: Card(
                          elevation: 0,
                          child: Image.asset('assets/$userSelection.gif',
                              height: height * 0.30, width: width / 4),
                        ),
                      ),
                      SlideTransition(
                        position:
                        Tween<Offset>(begin: Offset(10, 0), end: Offset.zero)
                            .animate(_animationController),
                        child: Card(
                          elevation: 0,
                          child: Image.asset('assets/$botSelection.gif',
                              height: height * 0.30, width: width / 4),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]),
          SizedBox(height: height*0.1,),
          Center(
            child: ClipOval(
              child: Material(
                color: Colors.blue, // button color
                child: InkWell(
                  splashColor: Colors.red, // inkwell color
                  child: SizedBox(
                      width: 56, height: 56, child: Icon(Icons.refresh)),
                  onTap: () {
                    setState(() {
                      _animationController.reverse();
                      firstLayerVisible = true;
                      secondLayerVisible = false;
                    });
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
