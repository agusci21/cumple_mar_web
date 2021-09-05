import 'package:flutter/material.dart';

class ValidationService extends ChangeNotifier{

  GlobalKey<FormState> createCardKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();

}