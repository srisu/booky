import 'package:flutter/material.dart';
import 'homepage.dart';

void main() async {
//  WidgetsFlutterBinding.ensureInitialized();
//  await DB.init();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo', theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
      home: MyHomePage(),
      routes: {
        'profile': (context) => MyHomePage(),
        /*Here's where you receive your routes, and it is also the main widget*/
      },
    );
  }
}
