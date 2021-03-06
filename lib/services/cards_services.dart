import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cumple_mar/models/cards_model.dart';

class CardsService extends ChangeNotifier{

  final String _baseUrl = 'cumple-mar-d195a-default-rtdb.firebaseio.com';
  final List<Cards>cards = [];
  bool isLoading = true;

  late Cards selectedCard;

  late String finalName;
  late String finalMenssaje;

  CardsService(){
    this.loadCards();
  }

  Future<List<Cards>> loadCards()async{

    this.isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'cards.json');
    final resp = await http.get(url);

    final Map<String, dynamic> cardsMap = json.decode(resp.body);

    cardsMap.forEach((key, value) {
      final tempCards = Cards.fromMap(value);
      tempCards.id = key;
      this.cards.add(tempCards);
    });

    this.isLoading = false;
    notifyListeners();

    return this.cards;

  }

  Future createCard (Cards cards)async{
    final url = Uri.https(_baseUrl, 'cards.json');
    final resp = await http.post(url, body: cards.toJson());
    final decodedData = resp.body;
    print(decodedData);
  }
  
  
 
}