import 'package:flutter/material.dart';

import 'pages/pages.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cumpleaños Martina',
      initialRoute: '/home',
      routes: {
        '/home' : (BuildContext context) => HomePage(),
      },
    );
  }
}