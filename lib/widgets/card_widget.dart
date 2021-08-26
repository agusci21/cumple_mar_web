import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screeHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      //height: screeHeight * 0.25,
      height: 20,
      width: screenWidth * 0.8 ,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.red
      ),
      child: ListTile(
        onTap: (){
          
        },
      ),
    );
  }
}