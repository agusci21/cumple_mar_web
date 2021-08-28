import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cumple_mar/models/card_model.dart' as my;

class CardServices extends ChangeNotifier{

  String url = 'https://cumple-mar-d195a-default-rtdb.firebaseio.com/cards.json';
  final List cardList = [];

  loadCards()async{

    var jsonCoded = await http.get(Uri.parse(url));
    Map<String, dynamic> jsonDecoded = jsonDecode(jsonCoded.body);

    print(jsonDecoded);
   
  }
 
}