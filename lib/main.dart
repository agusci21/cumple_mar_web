import 'package:cumple_mar/services/card_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/pages.dart';
 
void main() => runApp(MyApp());

// class AppState extends StatelessWidget {
//   const AppState({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (BuildContext context) => CardsService())
//       ],
//       child: MyApp(),
//     );
//   }
// }
 
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