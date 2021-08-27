// import 'dart:convert';

// import 'package:cumple_mar/models/card_model.dart' as my;
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class CardsService extends ChangeNotifier{

//   final String completeUrl = 'https://cumple-mar-default-rtdb.firebaseio.com/cards.json';

//   final String _baseUrl = 'cumple-mar-default-rtdb.firebaseio.com';

//   final List<my.Card> cards = [];

//   bool isLoading = true;

//   CardsService(){
//     this.loadCards();
//   }

//   Future<Map<String, String>> loadCards()async{
//     final url = Uri.https(_baseUrl, 'cards.json');
//     final resp = await http.get(url);

//     final Map<String, String> cardsMap = jsonDecode(completeUrl);
//     print(cardsMap);
//     return cardsMap;
//   }

// //   TODO: Hacer fetch 

// }