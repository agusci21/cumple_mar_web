import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cumple_mar/models/cards_model.dart';

class CardServices extends ChangeNotifier{

  String url = 'https://cumple-mar-d195a-default-rtdb.firebaseio.com/cards.json';
  final List<Cards> cardList = [];

  CardServices(){
    loadCards();
  }

   loadCards()async{

    final resp = await http.get(Uri.parse(url));
    final Map cardsMap = json.decode(resp.body);

    cardsMap.forEach((key, value) {
      final tempCard = Cards.fromMap(value);
      print(tempCard);
    });

    print ('CARDMAP: $cardsMap');
    print(cardsMap is Map);

  }
  
  
 
}