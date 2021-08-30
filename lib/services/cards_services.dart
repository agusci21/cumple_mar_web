import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cumple_mar/models/cards_model.dart';

class CardsService extends ChangeNotifier{

  //String url = 'https://cumple-mar-d195a-default-rtdb.firebaseio.com/cards.json';
  
  final String _baseUrl = 'cumple-mar-d195a-default-rtdb.firebaseio.com';
  final List<Cards>cards = [];
  bool isLoading = true;

  CardsService(){
    this.loadCards();
  }

  /*Future<List<Cards>>*/ loadCards()async{

    final url = Uri.https(_baseUrl, 'cards.json');
    final resp = await http.get(url);

    final Map<String, dynamic> cardsMap = json.decode(resp.body);

    cardsMap.forEach((key, value) {
      final tempCards = Cards.fromMap(value);
      tempCards.id = key;
      this.cards.add(tempCards);
    });


  }
  
  
 
}