
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'features.dart';

// ignore: use_key_in_widget_constructors
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  bool isLoading = true;

  @override
  void initState() {
    isLoading = false;
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF65b3f8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElasticInDown(
                child: ZoomIn(
                  duration: const Duration(seconds: 2),
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: MediaQuery.of(context).size.width*0.4,
                  ),
                ),
                duration: const Duration(seconds: 1),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() async {

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) =>  Features()));



    }


}
