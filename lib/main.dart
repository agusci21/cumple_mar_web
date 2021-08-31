import 'package:cumple_mar/providers/selected_card_provider.dart';
import 'package:cumple_mar/services/cards_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/pages.dart';
 
void main() => runApp(AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CardsService() ),
        ChangeNotifierProvider(create: (_) => SelectedCardProvider())
      ],
      child: MyApp(),
    );
  }
}

 
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