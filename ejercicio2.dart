/*
Crea un programa que devuelva una lista con todos los elementos únicos
de otra lista.
*/
void main() {
  final List<dynamic> elementos = [
    1,
    2,
    2,
    3,
    4,
    4,
    5,
    "a",
    "b",
    "b",
    "c",
    "d",
    "d",
    "e",
  ];

  final elementosUnicos = elementos.where((elemento) {
    int contador = 0;
    //Compara el elemento tomado con todos los que se encuentran en la lista.
    elementos.forEach((element) {
      if (elemento == element) contador++;
    });
    //Como se llega a comparar consigo mismo eso quiere decir que si este solo aparece una vez, es unico.
    return contador == 1;
  }).toList();

  print(elementosUnicos);
}
