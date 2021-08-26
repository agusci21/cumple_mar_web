import 'package:cumple_mar/models/card_model.dart' as my;
import 'package:flutter/material.dart';

class CardsService extends ChangeNotifier{

  final String completeUrl = 'https://cumple-mar-default-rtdb.firebaseio.com/cards.json';

  final String _baseUrl = 'cumple-mar-default-rtdb.firebaseio.com';

  final List<my.Card> cards = [];

  //TODO: Hacer fetch 

}