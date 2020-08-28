import 'package:flutter/material.dart';
double width, height;

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
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
    return Card(
      elevation: 0,
      child: Image.asset(item,height: height*0.30, width: width/4),
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
          SizedBox(height: height*0.3,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomCard(item: 'assets/rock.gif'),
              CustomCard(item: 'assets/paper.gif'),
              CustomCard(item: 'assets/scissors.gif'),
            ],
          ),

        ],
      ),
    );
  }
}
