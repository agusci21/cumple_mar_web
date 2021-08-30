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
   
    double screeHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      height: screeHeight * 0.7,
      width: screenWidth * 0.8 ,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.red
      ),
      child: Column(
        children: [
          _picture(),
          _nameText(),
        ],
      ),
    );
  }

  Text _nameText() {
    return Text(
          title,
          style: TextStyle(
            color: MyTheme.containerTextColor
          ),
        );
  }

  _picture() {
    return Container(
      child: FadeInImage(
        image: NetworkImage(photoUrl) ,
        placeholder:AssetImage('assets/img/placeholderGif.gif') ,
      ),
    );
  }
}