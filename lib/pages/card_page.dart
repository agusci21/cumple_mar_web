
import 'package:cumple_mar/services/cards_services.dart';
import 'package:cumple_mar/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final cardsService = Provider.of<CardsService>(context);

    return Scaffold(
      body: Column(
          children: [
            Picture(photoUrl:cardsService.selectedCard.picture as String),
            NameText(title: cardsService.selectedCard.name),
            _Messaje()
          ],
        ),
    );
  }
}

class _Messaje extends StatelessWidget {
  const _Messaje({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        //TODO: Implementar mensaaje
        ''
      ),
    );
  }
}