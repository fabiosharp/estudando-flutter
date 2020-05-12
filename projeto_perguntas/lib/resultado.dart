import 'package:flutter/material.dart';

class Resultado extends StatelessWidget{
  
  final int _pontuacao;
  final void Function() _reiniciarQuestionario;

  Resultado(this._pontuacao, this._reiniciarQuestionario);

  String get fraseResultado {
    if (this._pontuacao < 8)
      return 'Parabens!';
    if (this._pontuacao < 12)
      return 'Você é Bom!';
    if (this._pontuacao < 16)
      return 'Impressionante!';
    
    return 'Nível Jedi!';
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      
      children: <Widget>[
        Center(
          child: Text(fraseResultado, 
              style: TextStyle(fontSize: 28)
            ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
          child: FlatButton(
            child: Text("Reiniciar",
              style: TextStyle(fontSize: 18),
              ),
            textColor: Colors.blue,
            color: Color(0xFFECECEC),
            autofocus: true,
            onPressed: this._reiniciarQuestionario,
          ),
        )
      ],
    );
  }

}