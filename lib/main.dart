
import 'package:cumple_mar/pages/card_page.dart';
import 'package:cumple_mar/pages/create_card_page.dart';
import 'package:cumple_mar/pages/home_page.dart';
import 'package:cumple_mar/pages/loading_page.dart';
import 'package:cumple_mar/services/cards_services.dart';
import 'package:cumple_mar/services/validations_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

 
void main() => runApp(AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CardsService()),
        ChangeNotifierProvider(create: (_) => ValidationService())
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
      initialRoute: '/create',
      routes: {
        '/home' : (BuildContext context) => HomePage(),
        '/imposibleToGuessCardPage' : (BuildContext context) => CardPage(),
        '/loading' : (BuildContext context) => LoadingPage(),
        '/create'  : (BuildContext context) => CreateCardPage(),
      },
    );
  }
}