import 'package:flutter/material.dart';

import 'package:cumple_mar/theme/theme.dart';

class HomePage extends StatelessWidget {
  
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
          Positioned(child: _AppBar(),left: 0,top: 0,),
        ],
      )
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

    return Container(
      height: screenHeight * 0.1,
      width: screenWidth,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [MyTheme.primaryColor, Color.fromRGBO(230, 35, 215, 1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
        )
      ),
      child: TextButton(
        onPressed: (){},
        child: Text(
          'FELIZ CUMPLEAÑOS',
          style: TextStyle(
            color: Colors.black,
            fontFamily: MyTheme.primaryFont,
          ),
        ),
      ),
    );
  }
}