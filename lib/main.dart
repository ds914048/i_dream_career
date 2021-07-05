import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:i_dream_career/screens/splash.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
//force to stay portraitUp
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
  runApp(MyApp());});

}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFFBFCFE),
      ),
      home: SplashScreen(),
    );
  }
}