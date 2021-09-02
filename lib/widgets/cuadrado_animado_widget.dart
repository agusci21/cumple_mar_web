import 'package:flutter/material.dart';
import 'dart:math' as math;

class CuadradoAnimado extends StatefulWidget {
  const CuadradoAnimado({
    Key? key,
  }) : super(key: key);

  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation<double> girar;
  

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 20000)
    );

    controller.addListener(() {
      if(controller.status == AnimationStatus.completed){
        controller.repeat();
      }  
    }
   );

    girar = Tween(begin: 0.0,  end: 2 * math.pi).animate(controller);

    

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    controller.forward();

    return AnimatedBuilder(
     animation: controller,
     child: _Rectangulo(),
     builder: (BuildContext context, Widget? child){
       return Transform.rotate(
         angle: girar.value,
         child: child,
       );
     }
    );
  }
}

class _Rectangulo extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return Container(
       width: MediaQuery.of(context).size.width * 0.8,
       height: MediaQuery.of(context).size.width * 0.8,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(50),
         gradient: LinearGradient(
           begin: Alignment.topLeft,
           end: Alignment.bottomRight,
           colors: [
             Color.fromRGBO(236, 98, 188, 1),
             Color.fromRGBO(241, 142, 172, 0.5)
           ]
         )
       ),
     );
   }
}