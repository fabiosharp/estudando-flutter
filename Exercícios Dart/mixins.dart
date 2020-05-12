class Carro{
  int _velocidade = 0;

  int acelerar(){
    _velocidade += 5;
    return _velocidade;
  }

  int frear() {
    _velocidade -= 5;
    return _velocidade;
  }
}

mixin Esportivo {
  bool _turboLigado = false;

  void ligarTurbo() {
    _turboLigado = true;
  }

  void desligarTurbo() {
    _turboLigado = false;
  }
}

mixin Luxo {
  bool _arLigado = false;

  void ligarAr() {
    _arLigado = true;
  }

  void desligarAr() {
    _arLigado = false;
  }
}

class Ferrari extends Carro with Esportivo, Luxo{

  @override
  int acelerar(){
    if (this._turboLigado) // acelera dobrado
      super.acelerar();

    return super.acelerar();
  }
}

void main(){
  Ferrari c1 = new Ferrari();

  print(c1.acelerar());
  print(c1.acelerar());
  print(c1.acelerar());

  print(c1.frear());
  print(c1.frear());
  print(c1.frear());
}