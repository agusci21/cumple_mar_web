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
    return MaterialButton(
      onPressed: (){
        //TODO: SETEar el valor sel selected card y navegar ahi
      },
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        width: screenWidth * 0.8 ,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.red
        ),
        child: Column(
          children: [
            Picture(photoUrl: photoUrl),
            NameText(title: title),
          ],
        ),
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
            color: MyTheme.containerTextColor,
            fontSize: 25,
            fontWeight: FontWeight.w700
          ),
        );
  }
}