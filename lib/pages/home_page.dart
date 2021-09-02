
import 'dart:ui';

import 'package:cumple_mar/pages/loading_page.dart';
import 'package:cumple_mar/services/cards_services.dart';
import 'package:cumple_mar/widgets/card_widget.dart';
import 'package:cumple_mar/widgets/cuadrado_animado_widget.dart';
import 'package:flutter/material.dart';

import 'package:cumple_mar/theme/theme.dart';
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
          //_BodyScroll(),
          //_AppBar(),
        ],
      )
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
          colors: [
            Color(0Xff2e305f),
            Color(0xff202333),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )
      ),
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
        Header()
        //_upperRowAppBar(screenHeight, screenWidth),
        //_lowerRowAppBar(screenHeight, screenWidth)
      ],
    );
  }


  Container _upperRowAppBar(double screenHeight, double screenWidth) {
    return Container(
        height: screenHeight * 0.11,
        width: screenWidth,
        decoration: BoxDecoration(
          color: MyTheme.primaryColor,
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

class Header extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    int r = 255;
    int g = 255;
    int b = 255;
    return Stack(
      children: [
        Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.2,
              child: CustomPaint(
                painter: _HeaderWaveGradientPainter(),
            )
          ),
          Positioned(
            top: 35,
            child: Text('  FELIZ CUMPLEAÑOS MARTINA',
              style: TextStyle(fontSize: 25,
              fontWeight: FontWeight.w800,
              color: Color.fromRGBO(r, g, b, 0.8),
              )
            ),
          )
      ],
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
    

    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(top: screenHeight * 0.15),
      child: ListView.builder(
        itemCount: cards.length,
        itemBuilder: (context, index){
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
      )
    );
  }
}

class _HeaderWaveGradientPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {

    double x = size.width;
    double y  = size.height * 5;
    final Rect rect = Rect.fromCircle(
     center: Offset(size.width * 0.5 ,55),
     radius: 180
    );

    final Gradient gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xff615AAB), 
        Color(0xffC012FF),
        Color(0xff6D05FA),
    ]
    );

    final lapiz = Paint()..shader = gradient.createShader(rect);
    
    lapiz.color = Colors.red;
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 20;

    final path = Path();
    
    
    path.lineTo(0, y * 0.16);
    path.lineTo(x, y * 0.16);
    path.lineTo(x, 0);
    

    canvas.drawPath(path, lapiz);
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {

    return true;
  }

}