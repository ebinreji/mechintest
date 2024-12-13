import 'dart:async';

import 'package:flutter/material.dart';

import 'home_screen.dart';
void main(){
  runApp(MaterialApp(home: Splash(),debugShowCheckedModeBanner: false,));
}
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 3), (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
    } );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage("assets/image/Hotel.png"),

          ),
        ),
      ),
    );
  }
}
