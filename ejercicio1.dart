/*
Cree un programa el cual imprima una lista con los primeros 15 números de
la sucesión de Fibonacci.
*/

void main() {
  /* Sucesion de fibonacci, i= 0 b= 1 , i + b = c, i = b y b = c */
  int primerNumero = 0;
  int segundoNumero = 1;
  final List<int> numerosFibo = [];

  for (int i = 0; i < 15; i++) {
    numerosFibo.add(primerNumero);
    int temp = primerNumero + segundoNumero;
    primerNumero = segundoNumero;
    segundoNumero = temp;
  }

  print(numerosFibo);
}
