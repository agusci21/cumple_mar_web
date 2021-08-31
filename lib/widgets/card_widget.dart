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
      width: screenWidth * 0.8 ,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.red
      ),
      child: Column(
        children: [
          _picture(context),
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

  _picture(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          )
        ),
        child: FadeInImage(
          fit: BoxFit.cover,
          image: NetworkImage(photoUrl) ,
          placeholder:AssetImage('assets/img/placeholderGif.gif') ,
        ),
      ),
    );
  }
}