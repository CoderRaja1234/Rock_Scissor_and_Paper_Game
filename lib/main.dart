import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(
      MaterialApp(
        home:Splash(),
  ));
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    Timer(Duration(seconds: 5),
            ()=>Navigator.pushReplacement(
                context,MaterialPageRoute(
                builder:(context) => Home()
        )
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/home.gif'),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Game'),
    ),
    body: Text('Hello'),
  );
  }
}