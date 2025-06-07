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

    elementos.forEach((element) {
      if (elemento == element) contador++;
    });

    return contador == 1;
  }).toList();

  print(elementosUnicos);
}
