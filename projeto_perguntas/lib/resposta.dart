import 'package:flutter/material.dart';

class Resposta extends StatelessWidget{
  
  final String resposta;
  final void Function() quandoSelecionado;

  Resposta(this.resposta, this.quandoSelecionado);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.blue,
        child: Text(this.resposta),
        onPressed: this.quandoSelecionado,
      ),
    );
  }

}