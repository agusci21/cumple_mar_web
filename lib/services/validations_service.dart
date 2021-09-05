import 'package:flutter/material.dart';

class ValidationService extends ChangeNotifier{

  GlobalKey<FormState> createCardKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  String? name;
  String patern = '[ ]';
  void setName (String value){
    name = value;
    if(value.isEmpty || value == '' || value == ' ' || value == '  '){
      name = 'Ingrese su nombre';
    }
    notifyListeners();
  }

}