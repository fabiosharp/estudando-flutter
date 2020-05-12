
import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import './resultado.dart';
import './questionario.dart';

void main(){
  runApp(new PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp>{

  var perguntaSelecionada = 0;
  var _pontuacaoTotal=0 ;

  final List<Map<String, Object>> _perguntas = const [
    {
      'texto' : 'Qual o sua cor favorita ?',
      'resposta' : [
        {'texto':'Preto', 'pontuacao' : 7},
        {'texto':'Vermelho', 'pontuacao' : 2},
        {'texto':'Verde', 'pontuacao' : 4},
        {'texto':'Branco', 'pontuacao' : 10},
        ]
    },
    {
      'texto' : 'Qual o seu animal favorito ?',
      'resposta' : [
        {'texto':'Coelho', 'pontuacao' : 3},
        {'texto':'Sogra', 'pontuacao' : 1},
        {'texto':'Elefante', 'pontuacao' : 6},
        {'texto':'Leão', 'pontuacao' : 10},
        ]
    },
    {
      'texto' : 'Qual o seu instrutor favorito ?',
      'resposta' : [
        {'texto' : 'Maria',  'pontuacao': 1},
        {'texto' : 'João',  'pontuacao': 4},
        {'texto' : 'Léo',  'pontuacao': 6},
        {'texto' : 'Fábio', 'pontuacao': 10},
        ]
    }
  ];

  void _reiniciarQuestionario() {
    this.setState((){
      this.perguntaSelecionada = 0;
      this._pontuacaoTotal = 0;
    });
  }

  void responder(int pontuacao){
    this.setState(() {
      perguntaSelecionada++;
      _pontuacaoTotal += pontuacao;
    });

    print(_pontuacaoTotal);
  }

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < _perguntas.length;
  }  

  @override
  Widget build(BuildContext context) {

    return MaterialApp( 
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),

        ),
        body: this.temPerguntaSelecionada ? 
          Questionario(
              perguntas: this._perguntas,
              perguntaSelecionada: this.perguntaSelecionada,
              responder: this.responder,
          ) : Resultado(this._pontuacaoTotal, _reiniciarQuestionario),
      ), 
      
    );
  }

}

class PerguntaApp extends StatefulWidget {

  @override
  _PerguntaAppState createState() {

    return new _PerguntaAppState();
  }

}