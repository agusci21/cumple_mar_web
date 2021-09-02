import 'package:cumple_mar/theme/theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardWidget extends StatelessWidget {
  
  CardWidget({
    required this.title,
    required this.photoUrl,
  });

 String title;
 String photoUrl;

  @override
  Widget build(BuildContext context) {
   
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: Color.fromRGBO(62, 66, 107, 0.7),
        borderRadius: BorderRadius.circular(25)
      ),
      child: Column(
        children: [
          Picture(photoUrl: photoUrl),
          NameText(title: title)
        ],
      ),
    );
  }
}

class Picture extends StatelessWidget {
  const Picture({
    Key? key,
    required this.photoUrl,
  }) : super(key: key);

  final String photoUrl;
  
  @override
  Widget build(BuildContext context) {
  final sh = MediaQuery.of(context).size.height;
    return Container(
      width: sh * 0.185,
      height: sh * 0.185,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color.fromRGBO(255, 255, 255, 0),
        image: DecorationImage(
          image: NetworkImage(photoUrl),
          fit: BoxFit.cover
        )
      ),
       
    );
  }
}

class NameText extends StatelessWidget {
  const NameText({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
          title,
          style: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 0.8),
            fontSize: 20,
            fontWeight: FontWeight.w700
          ),
        );
  }
}