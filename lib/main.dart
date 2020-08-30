import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:async';
double width, height;
String userSelection;

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
  void initState(){
    Timer(Duration(seconds: 4),
            ()=>Navigator.pushReplacement(
            context,MaterialPageRoute(
            builder:(context) => Home()
        )
        ));
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

void calc(String userSelection){
  int bot = Random().nextInt(3), userItem;;
  String botSelection;

  if(bot == 0)
    botSelection = 'rock';
  if(bot == 1)
    botSelection = 'paper';
  if(bot == 2)
    botSelection = 'scissors';

  print("Bot selected $botSelection");
  //0 = rock, 1 = paper, 2 = scissors
  if(userSelection == 'rock')
    userItem = 0;
  if(userSelection == 'paper')
    userItem = 1;
  if(userSelection == 'scissors')
    userItem = 2;

  if(bot == userItem)
    print("Draw");

  else{
    if(userItem == 0){
      if(bot == 1)
        print("You lose!! $botSelection covers $userSelection");
      if(bot == 2)
        print("You win!! $userSelection smashes $botSelection");
    }

    if(userItem == 1){
      if(bot == 0)
        print("You win!! $userSelection covers $botSelection");
      if(bot == 2)
        print("You lose!! $botSelection cut $userSelection");
    }

    if(userItem == 2){
      if(bot == 0)
        print("You lose!! $botSelection smashes $userSelection");
      if(bot == 1)
        print("You win!! $userSelection cut $botSelection");
    }
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class CustomCard extends StatelessWidget {
  String item;
  CustomCard({this.item});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("Statement");
        userSelection = item;
        calc(item);
      },
      child: Card(
        elevation: 0,
        child: Image.asset('assets/$item.gif',height: height*0.30, width: width/4),
      ),
    );
  }
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Column(
        children: [
          SizedBox(height: height*0.05,),
          Text('RockPaperScissors', style: TextStyle(fontFamily: 'KaushanScript', fontSize: 38),),
          SizedBox(height: height*0.2,),
          Text('SELECT', style: TextStyle(fontFamily: 'KaushanScript', fontSize: 28),),
          SizedBox(height: height*0.05,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomCard(item: 'rock'),
              CustomCard(item: 'paper'),
              CustomCard(item: 'scissors'),
            ],
          ),

        ],
      ),
    );
  }
}
