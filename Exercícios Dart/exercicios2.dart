void imprimirProduto(int qtde, {String nome, double preco}){
  for(int i = 0; i < qtde; i++){
    print('O produto $nome tem o preço $preco');
  }
}

class Produto{

  String nome;
  double preco;

  Produto(this.nome, this.preco);

  /* 
  // Construtor convencional
  Produto(){
    this.nome = 'vazio';
    this.preco = 0;
  }
 */

  void escrivinha(){
    print(this.nome);
    print(this.preco);
  }

}

main() {
  var p1 = new Produto('Geladeira', 1899.90);
  p1.escrivinha();
  p1.nome = 'Lápis';
  p1.preco = 4.99;
  p1.escrivinha();

  imprimirProduto(5 , preco : p1.preco, nome : p1.nome);

}


/* 
// Função por referência
int exec(int a, int b, int Function(int, int) fn ){
  return  fn(a, b);
}

void main(){
  final r = exec(13, 5, (a, b) => a - b);

  print ('resultado é $r');
} */

/* 
// chamando funções 
main(){
  print( soma (8, 7) );
}

int soma(int a, int b){
  return (a + b);
} */