import 'package:flutter/material.dart';

class Questao extends StatelessWidget {

  final String texto;

  Questao(this.texto);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin:EdgeInsets.all(10),
      alignment: Alignment.center,
      child: Text(
        this.texto,
          style: TextStyle(
            fontSize: 20
          ),
      ),
    );
  }
}