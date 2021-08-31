import 'package:flutter/material.dart';

class SelectedCardProvider extends ChangeNotifier{

 late int selectedCard;

//  int get selectedCard{
//    return this._selectedCard;
//  }

 set cardsOnTapped(int cardsOnTapped){

  this.selectedCard = cardsOnTapped;
  notifyListeners();
 }

 @override
  void notifyListeners() {
    super.notifyListeners();
  }

}