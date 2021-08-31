
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
      
      body: Stack(
        children: [
          Stack(
            children: [
              _BodyScroll(),
              Header(),
            ],
          ),
        ],
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
  final cardsService = Provider.of<CardsService>(context);
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.2,),
            (cardsService.selectedCard.picture == null)
            ? Image(image: AssetImage('assets/img/no-image.png'))
            :Picture(photoUrl:cardsService.selectedCard.picture as String),
      
          ],
        ),
      ),
    );
  }
}
  

class _Message extends StatelessWidget {
  
  const _Message({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
  
    return Container(
      child: Text(
        message
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _HeaderWaveGradientPainter(),
          )
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.05,
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              size: 35,
              color: Color.fromRGBO(255, 255, 255, 0.8),
            )
          ),
        )
      ],
    );
  }
}

class _HeaderWaveGradientPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {

    double x = size.width;
    double y = size.height;
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
    
    
    path.lineTo(0, y * 0.15);
    path.quadraticBezierTo(x * 0.25, y * 0.2, x * 0.5, y * 0.15);
    path.quadraticBezierTo(x * 0.75, y * 0.1, x, y * 0.15);
    path.lineTo(x, 0);
    

    canvas.drawPath(path, lapiz);
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {

    return true;
  }

}

