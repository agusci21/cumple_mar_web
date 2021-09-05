import 'package:cumple_mar/services/validations_service.dart';
import 'package:cumple_mar/theme/theme.dart';
import 'package:cumple_mar/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateCardPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final validationService = Provider.of<ValidationService>(context);
    final double sh = MediaQuery.of(context).size.height;
    final double sw = MediaQuery.of(context).size.width;

    return Form(
      key: validationService.createCardKey,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient:LinearGradient(
            colors: MyTheme.gradientColors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _DemoCard(),
            _Inputs()
          ],
        ),
      )
    );
  }
}

class _DemoCard extends StatelessWidget {
  const _DemoCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double sh = MediaQuery.of(context).size.height;
    final double sw = MediaQuery.of(context).size.width;
    final validationService = Provider.of<ValidationService>(context);

    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: sh * .1),
      height: sw * 0.7,
      width: sw * 0.7,
      decoration: BoxDecoration(
        color: Color.fromRGBO(62, 66, 107, 0.7),
        borderRadius: BorderRadius.circular(25)
      ),

      child: Column(
        children: [

          Container(
            height: sw * 0.45,
            width: sw * 0.45,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100)
            ),
          ),

          Container(height: sw * 0.05,),

          Text(
            validationService.name ?? 'Su nombre',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25
            )
          ),
        ],
      ),
    );
  }
}

class _Inputs extends StatelessWidget {
  const _Inputs({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<ValidationService>(context);
    final double sh = MediaQuery.of(context).size.height;
    final double sw = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: sh * 0.05),
      width: sw * 0.85,
      child: Column(
        children: [

          TextFormField(
            maxLines: 1,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            cursorColor: Colors.white,
            style: TextStyle(color: Colors.white),
            controller: validationService.nameController,
            keyboardType: TextInputType.name,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.white
                )
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.white
                )
              ),
              labelText: 'Ingresa tu Nombre',
              labelStyle: TextStyle(color: Colors.white, fontSize: 20),
              //hintText: 'Ingresa tu Nombre',
              hintStyle: TextStyle(color: Colors.white),
              fillColor: Colors.white,
              hoverColor: Colors.white
            ),
            onChanged: (value){
              validationService.setName(value);
            },
          )
        ],
      ),
    );
  }
}