import 'package:cumple_mar/services/cards_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';


class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(62, 66, 107, 0.7),
      body: _Body(),
   );
  }
}

class _Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final ss = MediaQuery.of(context).size;
    final cardsService = Provider.of<CardsService>(context);
    return CustomScrollView(
      slivers: [

        SliverAppBar(
          expandedHeight: ss.height * 0.3,
          flexibleSpace: Image(
            image: NetworkImage(cardsService.selectedCard.picture ?? 'https://i.imgur.com/jJ8NnQ4.gif'),
            fit: BoxFit.cover,
          ),
        ),

        SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Nombre
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Text(
                          _randomMessage(context),
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),

                      //Mensaje
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        alignment: Alignment.center,
                        child: Center(
                          child: Text(
                            cardsService.selectedCard.message,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )

                    ],
                  ),
                );
              },
              childCount: 1
            ),
          ),
      ],
    );
  }
  String _randomMessage(BuildContext context){
    final cardsService = Provider.of<CardsService>(context);
    int x = Random().nextInt(4);
    late String random;
    switch(x){

      case 0:
        random = 'Te desea un Feliz Cumpleaños';
      break;
      
      case 1:
        random = 'Te desea un Feliz Cum';
      break;

      case 2:
        random = 'Te Aprecia un Monton';
      break;

      case 3:
        random = 'Te considera una persona Super importante en su vida';
      break;

      case 4:
        random = 'Cree que sos una persona increible';
      break;

      default:
        random = '';
    }
    return '${cardsService.selectedCard.name} $random';
  }
}
