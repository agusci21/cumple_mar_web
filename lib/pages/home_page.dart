
import 'package:cumple_mar/pages/loading_page.dart';
import 'package:cumple_mar/services/cards_services.dart';
import 'package:cumple_mar/theme/theme.dart';
import 'package:cumple_mar/widgets/card_widget.dart';
import 'package:cumple_mar/widgets/cuadrado_animado_widget.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:cumple_mar/models/cards_model.dart';

class HomePage extends StatelessWidget {
  
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final cardsService = Provider.of<CardsService>(context);
    
    if(cardsService.isLoading) return LoadingPage();

    return Scaffold(
      body:Stack(
        children: [
          _BackGround(),
          CuadradoAnimado(),
          _HappyBirthDayText(),
          _BodyScroll(),
        ],
      )
    );
  }
}

class _HappyBirthDayText extends StatelessWidget {
  const _HappyBirthDayText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: -15,
      top: MediaQuery.of(context).size.height * 0.02,
      child: Transform.rotate(
        angle: -0.5,
        child: Container(
          child: Text(
            '      Feliz   \n    Cumpleaños     \nMartina Rigotti Quel',
            style: TextStyle(
              color: Colors.white,
              fontSize: 50,
              fontFamily: 'Allison'
            ),
          ),
        ),
      ),
    );
  }
}

class _BackGround extends StatelessWidget {
  const _BackGround({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: MyTheme.gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
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

   final cardService = Provider.of<CardsService>(context);
    
   final List<Cards> cards = cardService.cards;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      //margin: EdgeInsets.only(top: screenHeight * 0.15),
      child: CustomScrollView(
  slivers: <Widget>[

    //SLIDER MARGEN

    SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 10,
        mainAxisSpacing: 11,
        crossAxisSpacing: 5.0,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            
          );
        },
        childCount: 70,
      ),
    ),

    SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index){
        return GestureDetector(
          onTap: (){
            cardService.selectedCard = cards[index];
            Navigator.of(context).pushNamed('/imposibleToGuessCardPage');
          },
          child: CardWidget(
            title: cards[index].name,
            photoUrl: cards[index].picture ?? 'https://i.imgur.com/jJ8NnQ4.gif',
          ),
        );
       },
        childCount: cards.length,
        ),
       ),
      ],
     )     
    );
  }
}
