
class Pessoa {
  String nome;
  String _cpf;

  Pessoa(this.nome, this._cpf);

  get cpf{
    return this._cpf;
  }

  set cpf(String cpf){
    this._cpf = cpf;
  }

  void escrivinha(){
    print('pessoa $nome tem o cpf $_cpf');
  }
}