import 'dart:convert';

import 'package:cumple_mar/services/card_services.dart';
import 'package:cumple_mar/widgets/card_widget.dart';
import 'package:flutter/material.dart';

import 'package:cumple_mar/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final cardService = Provider.of<CardServices>(context);
    List cardList = cardService.cardList;
    

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          cardService.loadCards();
        },
      ),
      body:Stack(
        children: [
          Container(height: double.infinity, width: double.infinity, color: Color.fromRGBO(178, 186, 187, 1),),//FONDO
          _BodyScroll(),
          Positioned(child: _AppBar(),left: 0,top: 0,),
        ],
      )
    );
  }
}


class _AppBar extends StatelessWidget {

  const _AppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

   final double screenWidth = MediaQuery.of(context).size.width;
   final double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _upperRowAppBar(screenHeight, screenWidth),
        _lowerRowAppBar(screenHeight, screenWidth)
      ],
    );
  }


  Container _upperRowAppBar(double screenHeight, double screenWidth) {
    return Container(
        height: screenHeight * 0.1,
        width: screenWidth,
        decoration: BoxDecoration(
          color: MyTheme.primaryColor,
          // gradient: LinearGradient(
          //   colors: [MyTheme.primaryColor, Color.fromRGBO(230, 35, 215, 1)],
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight
          // )
        ),
        child: TextButton(
          onPressed: (){},
          child: Text(
            'texto 1 mas grande',
            style: TextStyle(
              color: MyTheme.primaryTextColor,
              //TODO: Implementar fuentes
            ),
          ),
        ),
      );
  }

  Container _lowerRowAppBar(double screenHeight, double screenWidth) {
    return Container(
      height: screenHeight * 0.07,
      width: screenWidth,
      decoration: BoxDecoration(
        color: MyTheme.secondaryColor
      ),
      child: Center(
        child: Text(
          'texto 2 mas chico',
          style: TextStyle(
            color: MyTheme.secondaryTextColor
          ),
        )
      ),
    );
  } 
}

class _BodyScroll extends StatelessWidget {
  const _BodyScroll({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final cardService = Provider.of<CardServices>(context);
    List cardList = cardService.cardList;
    

    double screenHeight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(top: screenHeight * 0.18),
      child: ListView.builder(
        itemCount: cardList.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text(cardList[index]),
          );
        },
      )
    );
  }
}