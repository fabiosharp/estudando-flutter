

main() {
  var a = 1;
  a = 25;

  final b = 1;
  // b = 2; #ERROR

  const c = 1;
  // c = 2; #ERROR

}

/* 
// Dynamics, Conjuntos e Maps
main(){

  dynamic variavel = 'bla bla bla';
  variavel = 1;
  variavel = true;
  print('valor de variavel é ' + variavel.toString());

  Set<int> conjunto = {0, 1, 2, 3, 4, 4, 4, 4, 4, 4, 4, 4};

  print(conjunto.length);
  print('conjunto é Set ? ' + (conjunto is Set).toString());

  Map<String, double> notas = { 'Ana': 9.7, 'Bia' : 9.2, 'Carlos' : 7.8 };

  print('keys');
  for(var chave in notas.keys)
    print('chave = $chave');

  print('values');
  for(var valor in notas.values)
    print('valor = $valor');
  
  print('entries');
  for(var n in notas.entries)
    print('${n.key} = ${n.value}');

} */


/*
// Variáveis e tipagem
main (){
  double a = 3;
  a = 3.1;
  print(a);
  var c = "Texto de exemplo";
  print(c is String);

  print(true && false);
}
*/


/* 
// Arrays 
main(){

  var pessoas = ['Ana', 'Bia', 'Carlos'];
  pessoas.add('Daniel');
  pessoas.add('João Paulo');
  pessoas.add('Na Live');

  print(pessoas.length);
  print(pessoas.elementAt(0));
  print(pessoas[5]);

} */